import { initializeApp } from "firebase/app";
import { getAuth, signInWithEmailAndPassword } from "firebase/auth";
import { getDatabase, ref, get, set } from "firebase/database";

const firebaseConfig = {
  apiKey: process.env.FIREBASE_API_KEY,
  authDomain: process.env.FIREBASE_AUTH_DOMAIN,
  databaseURL: process.env.FIREBASE_DB_URL
};

const email = process.env.FIREBASE_EMAIL;
const password = process.env.FIREBASE_PASSWORD;
const deviceId = process.env.DEVICE_ID || "esp32-001";

if (!firebaseConfig.apiKey || !firebaseConfig.authDomain || !firebaseConfig.databaseURL) {
  throw new Error("Missing Firebase config env vars.");
}

if (!email || !password) {
  throw new Error("Missing FIREBASE_EMAIL or FIREBASE_PASSWORD.");
}

const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
const db = getDatabase(app);

async function main() {
  const cred = await signInWithEmailAndPassword(auth, email, password);
  const uid = cred.user.uid;

  const latestRef = ref(db, `users/${uid}/devices/${deviceId}/latest`);
  const manualSampleRef = ref(db, `users/${uid}/devices/${deviceId}/manualSample`);

  const latestSnapshot = await get(latestRef);
  console.log("Latest sensor payload:", latestSnapshot.exists() ? latestSnapshot.val() : null);

  await set(manualSampleRef, {
    nitrogen: 110,
    phosphorus: 45,
    potassium: 85,
    timestamp: Math.floor(Date.now() / 1000)
  });
  console.log("Wrote manual NPK sample.");
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
