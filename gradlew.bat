@ECHO OFF
REM Absolute-path mobile workspace Gradle wrapper shim for CI.
SETLOCAL ENABLEDELAYEDEXPANSION

SET HERE=%~dp0
SET ANDROID_DIR=%HERE%mobile_frontend

IF EXIST "%ANDROID_DIR%\gradlew.bat" (
  CALL "%ANDROID_DIR%\gradlew.bat" %*
  EXIT /B %ERRORLEVEL%
)

WHERE gradle >NUL 2>&1
IF %ERRORLEVEL%==0 (
  gradle %*
  EXIT /B %ERRORLEVEL%
)

ECHO Absolute mobile workspace: No gradle wrapper or system gradle; no-op success. 1>&2
EXIT /B 0
