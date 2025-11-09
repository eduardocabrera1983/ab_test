# Simple PowerShell Script to run AB Test Analysis and prepare Power BI data
# Run this script to execute your Jupyter notebook and create Power BI files

param(
    [string]$NotebookPath = "ab_test_original.ipynb",
    [string]$OutputDir = "powerbi_data",
    [switch]$OpenPowerBI
)

Write-Host "🚀 Starting AB Test Analysis..." -ForegroundColor Green

# Check if Jupyter is installed
try {
    jupyter --version | Out-Null
    Write-Host "✅ Jupyter found" -ForegroundColor Green
} catch {
    Write-Host "❌ Jupyter not found. Please install with: pip install jupyter" -ForegroundColor Red
    exit 1
}

# Execute Jupyter notebook
Write-Host "📓 Running AB test analysis..." -ForegroundColor Blue
try {
    jupyter nbconvert --to notebook --execute $NotebookPath --output "executed_ab_test.ipynb"
    Write-Host "✅ Analysis completed successfully" -ForegroundColor Green
} catch {
    Write-Host "❌ Error running analysis: $_" -ForegroundColor Red
    exit 1
}

# Check if Power BI data was created
if (Test-Path $OutputDir) {
    Write-Host "✅ Power BI data files created!" -ForegroundColor Green
    
    # List generated files
    $csvFiles = Get-ChildItem $OutputDir -Filter "*.csv"
    Write-Host "� Generated files:" -ForegroundColor Blue
    foreach ($file in $csvFiles) {
        $sizeKB = [math]::Round($file.Length / 1KB, 1)
        Write-Host "  • $($file.Name) ($sizeKB KB)" -ForegroundColor Cyan
    }
} else {
    Write-Host "⚠️ Power BI data directory not found. Check notebook execution." -ForegroundColor Yellow
}

# Optional: Open Power BI Desktop
if ($OpenPowerBI) {
    Write-Host "🔌 Opening Power BI Desktop..." -ForegroundColor Blue
    try {
        Start-Process "PBIDesktop.exe"
        Write-Host "✅ Power BI Desktop launched" -ForegroundColor Green
    } catch {
        Write-Host "⚠️ Could not launch Power BI Desktop automatically" -ForegroundColor Yellow
        Write-Host "   Please open it manually from Start Menu" -ForegroundColor White
    }
}

# Show next steps
Write-Host "`n🎯 Next Steps:" -ForegroundColor Yellow
Write-Host "1. Open Power BI Desktop" -ForegroundColor White
Write-Host "2. Get Data → Text/CSV" -ForegroundColor White  
Write-Host "3. Import CSV files from '$OutputDir' folder" -ForegroundColor White
Write-Host "4. Create visuals using the setup guide" -ForegroundColor White

Write-Host "`n📖 Resources:" -ForegroundColor Yellow
Write-Host "• Setup Guide: PowerBI_Setup_Guide.md" -ForegroundColor White
Write-Host "• Your Analysis: $NotebookPath" -ForegroundColor White

Write-Host "`n✨ Ready to build your Power BI dashboard!" -ForegroundColor Green