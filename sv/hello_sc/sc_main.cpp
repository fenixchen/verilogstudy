#include "Vour.h"

int sc_main(int argc, char **argv) {
	  Verilated::commandArgs(argc, argv);
      sc_signal<bool> clk;
      sc_signal<uint32_t> counter;
	  Vour* top = new Vour("top");
      top->clk(clk);
      top->counter(counter);

      sc_start(1, SC_NS);

      sc_trace_file *wf = sc_create_vcd_trace_file("counter");
      sc_trace(wf, clk, "clk");
      sc_trace(wf, counter, "counter");


      for (int i = 0; i < 10; i ++){
          clk = 0;
          sc_start(1, SC_NS);
          clk = 1;
          sc_start(1, SC_NS);
          cout << "@" << sc_time_stamp() << "counter=" << counter << endl;
      }
      

      cout << "final counter:" << counter << endl;
      sc_close_vcd_trace_file(wf);

	  delete top;
	  exit(0);
}
