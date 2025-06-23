enum MeasureState { idle, measuring, done }

class MeasureModel {
  bool isMeasuring = false;
  bool isDone = false;

  int hrv = 0;
  int gsr = 0;
}