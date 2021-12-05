@echo off
echo Enabling Ultimate Performance Power Plan
echo.
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
timeout 2 > NUL
powercfg.cpl
