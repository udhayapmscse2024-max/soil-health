from collections.abc import Sequence
from datetime import datetime, timezone
from uuid import uuid4

from soil_health.domain.models import SoilSample, SoilSampleCreate


class SoilSampleRepository:
    """Simple in-memory repository for initial development."""

    def __init__(self) -> None:
        self._samples: dict[str, SoilSample] = {}

    def create(self, payload: SoilSampleCreate) -> SoilSample:
        sample = SoilSample(
            **payload.model_dump(),
            id=str(uuid4()),
            created_at=datetime.now(timezone.utc),
        )
        self._samples[sample.id] = sample
        return sample

    def list(self) -> Sequence[SoilSample]:
        return sorted(self._samples.values(), key=lambda s: s.created_at, reverse=True)

    def get(self, sample_id: str) -> SoilSample | None:
        return self._samples.get(sample_id)
