# Quick Power BI Template Setup
# Run this to generate sample data and prepare Power BI files

param(
    [switch]$OpenPowerBI,
    [switch]$ShowFiles
)

Write-Host "🎯 AB Test Template - Power BI Setup" -ForegroundColor Green
Write-Host "=" * 45

# Run the template notebook
Write-Host "🚀 Generating sample data..." -ForegroundColor Blue
try {
    jupyter nbconvert --to notebook --execute "ab_test_template.ipynb" --output "executed_template.ipynb"
    Write-Host "✅ Sample data and analysis complete!" -ForegroundColor Green
} catch {
    Write-Host "❌ Error running template: $_" -ForegroundColor Red
    exit 1
}

# Check generated files
if (Test-Path "powerbi_data") {
    $files = Get-ChildItem "powerbi_data" -Filter "*.csv"
    Write-Host "`n📂 Power BI Files Created:" -ForegroundColor Blue
    foreach ($file in $files) {
        $rows = (Get-Content $file.FullName | Measure-Object).Count - 1
        Write-Host "  ✓ $($file.Name) ($rows rows)" -ForegroundColor Cyan
    }
} else {
    Write-Host "⚠️ Power BI data not created. Check notebook execution." -ForegroundColor Yellow
}

# Show file contents if requested
if ($ShowFiles) {
    Write-Host "`n📊 Sample Data Preview:" -ForegroundColor Yellow
    $summaryFile = "powerbi_data\ab_test_summary.csv"
    if (Test-Path $summaryFile) {
        Get-Content $summaryFile | Select-Object -First 6 | ForEach-Object {
            Write-Host "  $_" -ForegroundColor White
        }
    }
}

# Open Power BI if requested
if ($OpenPowerBI) {
    Write-Host "`n🔌 Opening Power BI Desktop..." -ForegroundColor Blue
    try {
        Start-Process "PBIDesktop.exe"
    } catch {
        Write-Host "⚠️ Could not launch Power BI Desktop" -ForegroundColor Yellow
        Write-Host "   Please open it manually" -ForegroundColor White
    }
}

Write-Host "`n🎉 Template Setup Complete!" -ForegroundColor Green
Write-Host "`n📋 Next Steps:" -ForegroundColor Yellow
Write-Host "1. Open Power BI Desktop" -ForegroundColor White
Write-Host "2. Get Data → Text/CSV" -ForegroundColor White
Write-Host "3. Import all 5 CSV files from 'powerbi_data' folder" -ForegroundColor White
Write-Host "4. Follow PowerBI_Visualization_Guide.md for dashboard creation" -ForegroundColor White

Write-Host "`n📖 Resources:" -ForegroundColor Cyan
Write-Host "• Main Notebook: ab_test_version_28_02_2026.ipynb" -ForegroundColor White
Write-Host "• Template Notebook: ab_test_template.ipynb" -ForegroundColor White
Write-Host "• Visualization Guide: PowerBI_Visualization_Guide.md" -ForegroundColor White
Write-Host "• Setup Guide: PowerBI_Setup_Guide.md" -ForegroundColor White
Write-Host "• Data Files: powerbi_data/ folder" -ForegroundColor White

Write-Host "`n🚀 Ready to build your AB test dashboard!" -ForegroundColor Green