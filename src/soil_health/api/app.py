from fastapi import Depends, FastAPI, HTTPException, status

from soil_health.domain.models import SoilSample, SoilSampleCreate
from soil_health.domain.repository import SoilSampleRepository

app = FastAPI(title="Soil Health API", version="0.1.0")
repo = SoilSampleRepository()


def get_repository() -> SoilSampleRepository:
    return repo


@app.get("/health")
def healthcheck() -> dict[str, str]:
    return {"status": "ok"}


@app.post("/samples", response_model=SoilSample, status_code=status.HTTP_201_CREATED)
def create_sample(
    payload: SoilSampleCreate,
    repository: SoilSampleRepository = Depends(get_repository),
) -> SoilSample:
    return repository.create(payload)


@app.get("/samples", response_model=list[SoilSample])
def list_samples(
    repository: SoilSampleRepository = Depends(get_repository),
) -> list[SoilSample]:
    return list(repository.list())


@app.get("/samples/{sample_id}", response_model=SoilSample)
def get_sample(
    sample_id: str,
    repository: SoilSampleRepository = Depends(get_repository),
) -> SoilSample:
    sample = repository.get(sample_id)
    if sample is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Sample not found")
    return sample
