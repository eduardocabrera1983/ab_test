# AB Test Analysis + Power BI Setup - COMPLETE

## What's Ready

A **unified system** combining rigorous statistical analysis with Power BI export capabilities, centered on the universal `ab_test_version_28_02_2026.ipynb` framework.

### Files in Your Project

| File | Purpose |
|------|---------|
| `ab_test_version_28_02_2026.ipynb` | **Main analysis notebook** — supports binary & continuous metrics |
| `ab_test_template.ipynb` | Supplementary template with sample data generation & Power BI CSV export |
| `PowerBI_Setup_Guide.md` | Simple 3-step Power BI import guide |
| `PowerBI_Visualization_Guide.md` | Dashboard creation templates |
| `run_analysis.ps1` | Automation script |
| `setup_template.ps1` | One-click sample data generation |
| `requirements.txt` | Python dependencies |
| `.gitignore` | Configured to protect private files |

### Analysis Features (ab_test_version_28_02_2026.ipynb)

- Configurable experiment metadata & metric type (binary / continuous)
- Derived values & validation
- Traffic allocation check
- Statistical significance (z-test or Welch's t-test)
- 95% confidence intervals (Wilson score or normal)
- Effect size (Cohen's h or Cohen's d)
- Power analysis with MDE
- Bayesian analysis (Beta-binomial or normal MC)
- Sample size planning for future tests
- 4-panel visualization saved as `ab_test_results.png`
- Final recommendations with decision framework
- Appendix: pre-experiment duration planner

### Power BI Integration (ab_test_template.ipynb)

- Exports 5 CSV files to `powerbi_data/`:
  - `ab_test_summary.csv` — Key metrics
  - `daily_performance.csv` — Daily trends
  - `confidence_intervals.csv` — Statistical confidence data
  - `segment_analysis.csv` — Device & traffic source breakdowns
  - `raw_user_sample.csv` — Sample raw data for drill-down

## Quick Start

### Option 1: Run Main Notebook
1. Open `ab_test_version_28_02_2026.ipynb`
2. Update your data in Section 1:
   ```python
   experiment_id = "492470"
   experiment_name = "Item Description Notification"
   metric_type = "binary"          # "binary" or "continuous"
   metric_name = "Cage Rate"
   lower_is_better = True

   # Binary data
   control_users = 640
   control_conversions = 53
   test_users = 1530
   test_conversions = 45
   ```
3. Run all cells — everything adapts automatically

### Option 2: Use Automation Script
```powershell
.\run_analysis.ps1

# Or open Power BI automatically
.\run_analysis.ps1 -OpenPowerBI
```

## Power BI Setup (3 Steps)

1. **Open Power BI Desktop**
2. **Import CSV files** from `powerbi_data/` folder
3. **Create visuals** using `PowerBI_Visualization_Guide.md`

### Recommended Dashboard Pages:
- **Executive Summary** — Key metrics and recommendations
- **Statistical Details** — Full analysis results
- **Time Trends** — Daily performance patterns
- **Segment Analysis** — Device & traffic source breakdowns

## Next Actions

1. **Run your analysis** with current experiment data in `ab_test_version_28_02_2026.ipynb`
2. **Generate Power BI data** via `ab_test_template.ipynb` or automation script
3. **Create your Power BI dashboard**
4. **Share with your team**

**You're all set!** The system is ready to transform your AB test analysis into professional dashboards. 🎉