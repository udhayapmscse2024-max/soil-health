from datetime import date, datetime
from typing import Literal

from pydantic import BaseModel, Field

NutrientLevel = Literal["low", "medium", "high"]


class Location(BaseModel):
    field_name: str = Field(min_length=2, max_length=100)
    latitude: float = Field(ge=-90, le=90)
    longitude: float = Field(ge=-180, le=180)


class SoilSampleCreate(BaseModel):
    location: Location
    collected_on: date
    ph: float = Field(ge=0, le=14)
    moisture_percent: float = Field(ge=0, le=100)
    nitrogen: NutrientLevel
    phosphorus: NutrientLevel
    potassium: NutrientLevel
    organic_carbon_percent: float = Field(ge=0, le=100)
    notes: str | None = Field(default=None, max_length=500)


class SoilSample(SoilSampleCreate):
    id: str
    created_at: datetime
