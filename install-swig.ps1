# PowerShell script to automate SWIG setup for Visual Studio Code Jupyter notebooks
# run with administrative privs

# Check if the script is running as an administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    # Get the script's current path
    $scriptPath = $MyInvocation.MyCommand.Definition

    # Restart the script with administrative rights
    Start-Process PowerShell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`"" -Verb RunAs
    Exit
}


# Add SWIG to the system PATH
$swigPath = "C:\Apps\swigwin-4.2.0"
$env:Path += ";$swigPath"
[System.Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::Machine)

# Set up environment variables for Python (example)
# Adjust these paths based on your Python installation
$pythonIncludePath = "C:\Path\To\Python\Include"
$pythonLibPath = "C:\Path\To\Python\Libs\pythonXX.lib"

# Setting environment variables for the current user
[System.Environment]::SetEnvironmentVariable("PYTHON_INCLUDE", $pythonIncludePath, [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable("PYTHON_LIB", $pythonLibPath, [System.EnvironmentVariableTarget]::User)

# Output to indicate completion
Write-Host "SWIG setup complete. SWIG path added to system PATH." -ForegroundColor Green
Write-Host "PYTHON_INCLUDE and PYTHON_LIB environment variables set for the current user." -ForegroundColor Green

