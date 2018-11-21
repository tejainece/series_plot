import 'package:grizzly_series/grizzly_series.dart';
import 'package:grizzly_plotly/grizzly_plotly.dart';
import 'package:plotly/plotly.dart';

class SeriesPlot<LT, VT extends num> {
  NumericSeriesView<LT, VT> series;

  void bar() {
    final fig = new Figure(
      traces: [
        new Bar(
          x: series.labels,
          y: series.data.asIterable,
        ),
      ],
      layout: new Layout(width: 500, height: 400, title: 'Basic Bar Chart'),
    );
  }
}

void main() {
  final series = new IntSeries<String>([20, 14, 23],
      name: 'Animal', labels: ['giraffes', 'orangutans', 'monkeys']);
  print(series);

  // Basic Bar Chart
  {
    final fig = new Figure(
      traces: [
        new Bar(
          x: ['giraffes', 'orangutans', 'monkeys'],
          y: [20, 14, 23],
        ),
      ],
      layout: new Layout(width: 500, height: 400, title: 'Basic Bar Chart'),
    );
    new Plot.id('output1', fig.tracesDict, fig.layoutDict);
  }

  // Grouped Bar Chart
  {
    final fig = new Figure(
      traces: [
        new Bar(
          x: ['giraffes', 'orangutans', 'monkeys'],
          y: [20, 14, 23],
          name: 'SF Zoo',
        ),
        new Bar(
          x: ['giraffes', 'orangutans', 'monkeys'],
          y: [12, 18, 29],
          name: 'SF Zoo',
        ),
      ],
      layout: new Layout(width: 500, height: 400, title: 'Grouped Bar Chart'),
    );
    new Plot.id('output2', fig.tracesDict, fig.layoutDict);
  }
}
