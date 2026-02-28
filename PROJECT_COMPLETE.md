# A/B Test Framework — Project Overview

## What's Built

A **complete A/B testing system** centered on a universal analysis notebook (`ab_test_version_28_02_2026.ipynb`) with Power BI integration via a supplementary template.

### Core Analysis (ab_test_version_28_02_2026.ipynb)

The main notebook is a **universal framework** — update one configuration cell and everything adapts:

| Feature | Binary Metrics | Continuous Metrics |
|---------|---------------|-------------------|
| Significance test | Two-proportion z-test | Welch's t-test |
| Confidence intervals | Wilson score (95%) | Normal approximation (95%) |
| Effect size | Cohen's h | Cohen's d |
| Bayesian model | Beta-binomial conjugate | Normal MC simulation |
| Power analysis | Exact binomial | Normal approximation |
| Visualizations | 4-panel chart | 4-panel chart |

**Supported metrics:** conversion rate, cage rate, CTR, bounce rate, revenue per user, avg docs per shipment, session duration, and any other binary or continuous metric.

**Output:** Statistical results, decision recommendations, and `ab_test_results.png`.

### Power BI Integration (ab_test_template.ipynb)

5 Power BI-ready datasets exported to `powerbi_data/`:
- `ab_test_summary.csv` — Key metrics
- `daily_performance.csv` — Time series trends
- `confidence_intervals.csv` — Statistical confidence data
- `segment_analysis.csv` — Device & traffic source breakdowns
- `raw_user_sample.csv` — Individual user records

### Professional Dashboard Templates

- **Page 1:** Executive Summary — KPIs, main charts, recommendations
- **Page 2:** Statistical Analysis — Detailed stats, confidence intervals
- **Page 3:** Time Trends — Daily patterns, weekday analysis
- **Page 4:** Segment Analysis — Device, traffic source breakdowns

### Documentation

| File | Purpose |
|------|---------|
| `README.md` | Project overview & quick start |
| `TEMPLATE_README.md` | Detailed project guide & variable reference |
| `PowerBI_Visualization_Guide.md` | Exact visual specifications for dashboards |
| `PowerBI_Setup_Guide.md` | Quick 3-step Power BI import process |

### Automation

| Script | Purpose |
|--------|---------|
| `run_analysis.ps1` | Execute notebook & prepare Power BI files |
| `setup_template.ps1` | One-click sample data generation |
| `set_python_default.ps1` | Configure Python 3.11.9 as VS Code default |

## How to Use

### Run Your Experiment Analysis
1. Open `ab_test_version_28_02_2026.ipynb`
2. Update **Section 1** with your experiment data (metric type, group labels, counts)
3. Run all cells — results, charts, and recommendations generated automatically

### Generate Power BI Data
```powershell
.\setup_template.ps1 -OpenPowerBI
```
Or run `ab_test_template.ipynb` manually.

### Build Dashboards
1. Open Power BI Desktop
2. Import 5 CSV files from `powerbi_data/`
3. Follow `PowerBI_Visualization_Guide.md` for visual specs

## Notebook Sections (ab_test_version_28_02_2026.ipynb)

| # | Section | Description |
|---|---------|-------------|
| 0 | Setup & Imports | numpy, scipy, statsmodels, matplotlib, seaborn |
| 1 | Experiment Configuration | **Only cell to edit** — metadata, metric type, data |
| 2 | Derived Values & Validation | Auto-computes rates, differences, direction |
| 3 | Traffic Allocation Check | Balanced randomization verification |
| 4 | Statistical Significance | Z-test or Welch's t-test with multi-alpha reporting |
| 5 | Confidence Intervals | 95% CIs for groups and difference |
| 6 | Effect Size | Cohen's h/d with magnitude classification |
| 7 | Power Analysis | Current power, MDE, adequacy assessment |
| 8 | Bayesian Analysis | Posterior distributions, P(benefit/harm) |
| 9 | Sample Size Planning | Future test sizing with duration estimates |
| 10 | Visualizations | 4-panel chart saved as `ab_test_results.png` |
| 11 | Final Recommendations | Decision framework with actionable next steps |
| App | Duration Planner | Standalone pre-experiment planning calculator |

## Next Steps

1. **Run analysis** with your current experiment data in `ab_test_version_28_02_2026.ipynb`
2. **Generate Power BI data** via template if dashboards are needed
3. **Share results** with stakeholders
4. **Standardize** — use this framework for all future A/B tests