# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, Timer

@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period (10MHz is common for simulation, or match your Chisel 2.5M cycles)
    # Using a faster clock in sim makes the 'slow' counters move faster
    clock = Clock(dut.clk, 100, unit="ns") 
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut._log.info("Testing Mode 7: Hamming Weight")
    # ui_in(7) is the MSB, so 0x80 or 0b10000000 selects Mode 7.
    # We add some other bits to count: 0b10000111 (Mode 7 + three 1s)
    # PopCount = 4. Your code: hammingWeight = 4 - 1 = 3.
    # In your code, is(3.U) { sevSeg := "b01001111".U } (Decimal 79)
    dut.ui_in.value = 0b10000111 
    await ClockCycles(dut.clk, 2)
    assert dut.uo_out.value == 79
    dut._log.info("Mode 7 Passed!")

    dut._log.info("Testing Mode 2: Counter 0-9")
    # Select Mode 2 by setting ui_in(2) high: 0b00000100 (Decimal 4)
    dut.ui_in.value = 4 
    await ClockCycles(dut.clk, 2)
    # Initially slow is 0. is(0.U) {sevSeg := "b00111111".U} (Decimal 63)
    assert dut.uo_out.value == 63
    dut._log.info("Mode 2 (Initial) Passed!")

    dut._log.info("Testing Mode 0: Clockwise Animation")
    # Select Mode 0 by setting ui_in(0) high: 0b00000001 (Decimal 1)
    # Note: Since your code prioritizes MSB, ensure all other ui_in bits are 0.
    dut.ui_in.value = 1
    await ClockCycles(dut.clk, 2)
    # Initially fast is 0. is(0.U) {sevSeg := "b00000001".U} (Decimal 1)
    assert dut.uo_out.value == 1
    dut._log.info("Mode 0 Passed!")

    # ==========================================================
    # PLACEHOLDER FOR SIMON SAYS (MODE 5)
    # ==========================================================
    # When you implement Simon Says, select it with ui_in = 32 (0b00100000)
    # dut.ui_in.value = 32
    # await ClockCycles(dut.clk, 10)
    # ==========================================================

    dut._log.info("All implemented tests passed!")
