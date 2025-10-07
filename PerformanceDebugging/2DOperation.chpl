import BlockDist.blockDist;
import Math.{sin, pi};
import Time.stopwatch;

config const n = 10;

var stencilTimer: stopwatch;

const DataDomain = blockDist.createDomain({1..n, 1..n});

var Data: [DataDomain] real;

// initialize the data
forall (i, j) in Data.domain {
  Data[i, j] = sin(i*pi)/j;
}

var OutData: [Data.domain] Data.eltType;

stencilTimer.start();
// run a 5-point stencil
forall (i, j) in {2..(n-1), 2..(n-1)} {
  OutData[i, j] = (Data[i  , j  ] +
                   Data[i-1, j  ] +
                   Data[i+1, j  ] +
                   Data[i  , j-1] +
                   Data[i  , j+1]) / 5;
}
stencilTimer.stop();

/*writeln("Checksum: ", + reduce OutData);*/
writeln("Checksum: ", + reduce OutData);

const totalBytes = DataDomain.size*numBytes(real)/10.0**9;
const elapsedTime = stencilTimer.elapsed();

writeln("\n", "="*40, "\nPerformance Report: ");
report("Data Size (GB)", totalBytes);
report("Stencil Time (s)", elapsedTime);
report("Stencil Performance (GB/s)", totalBytes/elapsedTime);
writeln("="*40, "\n");

proc report(metric, value) do writef("%30s: %8.3dr\n", metric, value);
