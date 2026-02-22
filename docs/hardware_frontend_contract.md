# Frontend ↔ Arduino Contract

The Arduino sketch emits newline-delimited JSON messages at 9600 baud, every 2 seconds.

## Sample payload

```json
{"moisture":42.6,"temperature":27.1,"estimatedPh":6.40}
```

## Fields

- `moisture`: percentage in range `0..100`
- `temperature`: soil temperature in Celsius
- `estimatedPh`: derived value until an analog pH probe is connected

## Integration notes for Flutter

- Open serial port using a Flutter serial package on desktop/mobile.
- Parse one JSON object per line.
- Bind values to dashboard cards.
- Show stale-data warning if no message is received for > 10 seconds.
