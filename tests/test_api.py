from datetime import date

from fastapi.testclient import TestClient

from soil_health.api.app import app, repo

client = TestClient(app)


def setup_function() -> None:
    repo._samples.clear()  # noqa: SLF001 - acceptable for test reset


def test_healthcheck() -> None:
    response = client.get("/health")

    assert response.status_code == 200
    assert response.json() == {"status": "ok"}


def test_create_and_get_sample() -> None:
    payload = {
        "location": {"field_name": "North Plot", "latitude": 12.5, "longitude": 77.6},
        "collected_on": str(date.today()),
        "ph": 6.8,
        "moisture_percent": 42.5,
        "nitrogen": "medium",
        "phosphorus": "low",
        "potassium": "high",
        "organic_carbon_percent": 1.6,
        "notes": "Initial baseline sample",
    }

    create_response = client.post("/samples", json=payload)
    assert create_response.status_code == 201
    sample = create_response.json()

    get_response = client.get(f"/samples/{sample['id']}")
    assert get_response.status_code == 200
    fetched = get_response.json()
    assert fetched["id"] == sample["id"]
    assert fetched["location"]["field_name"] == "North Plot"


def test_get_sample_not_found() -> None:
    response = client.get("/samples/non-existent")

    assert response.status_code == 404
    assert response.json()["detail"] == "Sample not found"
