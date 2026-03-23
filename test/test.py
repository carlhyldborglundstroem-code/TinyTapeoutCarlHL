import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, Timer

@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # 100ns period = 10MHz clock
    clock = Clock(dut.clk, 100, unit="ns") 
    cocotb.start_soon(clock.start())

    # --- Reset Sequence ---
    dut._log.info("Resetting Circuit")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 1)

    # --- Testing Mode 7: Hamming Weight ---
    dut._log.info("Testing Mode 7: Hamming Weight")
    # ui_in(7) is high to select Mode 7. 
    # Input: 0b10000111 -> PopCount is 4. 
    # Chisel Logic: switch(4 - 1) = switch(3)
    # is(3.U) -> sevSeg = 0b01001111
    # Final Output: ~sevSeg = 0b10110000 (Decimal 176)
    dut.ui_in.value = 0b10000111 
    await ClockCycles(dut.clk, 5)
    assert int(dut.uo_out.value) == 176
    dut._log.info("Mode 7 Passed!")

    # --- Testing Mode 6: Pulsing Light (PWM) ---
    dut._log.info("Testing Mode 6: Pulse Logic")
    # ui_in = 0b01000000 (Decimal 64) selects Mode 6
    dut.ui_in.value = 64
    await ClockCycles(dut.clk, 5)
    
    # At start, brightness is 0, so pulseSignal (pwmSlice < brightness) is ALWAYS false.
    # sevSeg is 0b11111111, but gated by pulseSignal(0), so finalSegments = 0.
    # uo_out = ~0 = 0b11111111 (Decimal 255)
    assert int(dut.uo_out.value) == 255
    dut._log.info("Mode 6 Initial (Off) Passed!")

    # --- Testing "All Switches Off" Idle State ---
    dut._log.info("Testing Idle State (All switches off)")
    dut.ui_in.value = 0
    await ClockCycles(dut.clk, 5)
    # Your code: Mux(anySwitchOn, ..., "b01111111")
    assert int(dut.uo_out.value) == 127
    dut._log.info("Idle State Passed!")

    # --- Testing Mode 0: Clockwise Animation ---
    dut._log.info("Testing Mode 0")
    dut.ui_in.value = 1 # Select Mode 0
    await ClockCycles(dut.clk, 5)
    # fast=0 -> sevSeg=0b00000001. Output = ~0b00000001 = 0b11111110 (Decimal 254)
    assert int(dut.uo_out.value) == 254
    dut._log.info("Mode 0 Passed!")

    dut._log.info("All tests for current Chisel logic passed!")
