# A/B Test Framework — Complete Project Guide

## What's Included

An end-to-end A/B testing system with a universal analysis notebook, Power BI integration, and professional documentation.

### Files

| File | Purpose |
|------|---------|
| `ab_test_version_28_02_2026.ipynb` | **Main analysis notebook** — universal framework for binary & continuous metrics |
| `ab_test_template.ipynb` | Supplementary template — sample data generation & Power BI CSV export |
| `powerbi_data/` | 5 CSV files ready for Power BI import |
| `PowerBI_Visualization_Guide.md` | Dashboard templates with exact visual specs |
| `PowerBI_Setup_Guide.md` | Quick 3-step import process |
| `run_analysis.ps1` | Automation script for notebook execution |
| `setup_template.ps1` | One-click sample data generation |

### Main Notebook Features (ab_test_version_28_02_2026.ipynb)

The main notebook is a **universal A/B test framework** that adapts to any experiment:

- **Binary metrics:** conversion rate, cage rate, click-through rate, bounce rate, etc.
- **Continuous metrics:** revenue per user, avg documents per shipment, session duration, etc.

| Section | Description |
|---------|-------------|
| Experiment Configuration | Single cell to update — everything else runs automatically |
| Derived Values & Validation | Rates, differences, direction labels |
| Traffic Allocation Check | Verifies balanced randomization |
| Statistical Significance | Z-test (binary) or Welch's t-test (continuous) |
| Confidence Intervals (95%) | Wilson score (binary) or normal (continuous) |
| Effect Size | Cohen's h (binary) or Cohen's d (continuous) |
| Power Analysis | Current power, MDE, adequacy assessment |
| Bayesian Analysis | Posterior distributions, P(benefit), P(harm) |
| Sample Size Planning | Future test sizing with duration estimates |
| Visualizations | 4-panel chart (`ab_test_results.png`) |
| Final Recommendations | Decision framework with actionable next steps |
| Duration Planner | Standalone pre-experiment calculator |

## Quick Start

### Option 1: Run Your Analysis (Fastest)
1. Open `ab_test_version_28_02_2026.ipynb`
2. Update Section 1 with your experiment data
3. Run all cells — results, charts, and recommendations generated automatically

### Option 2: Generate Sample Data + Power BI Files
```powershell
.\setup_template.ps1 -OpenPowerBI
```

### Option 3: Customize with Your Data
1. Open `ab_test_template.ipynb`
2. Replace the data generation section with your real data loading
3. Run all cells to generate Power BI CSV files

## Variables to Update (ab_test_version_28_02_2026.ipynb — Section 1)

| Variable | Description | Example |
|----------|-------------|---------|
| `experiment_id` | Your experiment ID | `"492470"` |
| `experiment_name` | Short description | `"Item Description Notification"` |
| `test_duration_days` | Days the test ran | `17` |
| `metric_type` | `"binary"` or `"continuous"` | `"binary"` |
| `metric_name` | Label for all charts & output | `"Cage Rate"` |
| `lower_is_better` | Direction preference | `True` |
| `control_label` | Control group display name | `"Control (OFF)"` |
| `treatment_label` | Treatment group display name | `"Treatment (ON)"` |

**Binary data:** `control_users`, `control_conversions`, `test_users`, `test_conversions`

**Continuous data:** `control_n`, `control_mean`, `control_std`, `test_n`, `test_mean`, `test_std`

## Power BI Dashboard Templates

### Ready-to-Build Dashboards:

#### Page 1: Executive Summary
- KPI cards for key metrics
- Conversion rate comparison chart
- Statistical significance indicator
- Business recommendation text

#### Page 2: Statistical Analysis
- Statistical summary table
- Confidence intervals visualization
- Effect size gauge
- Power analysis display

#### Page 3: Time Trends
- Daily conversion rate trends
- User volume over time
- Weekday vs weekend patterns

#### Page 4: Segment Analysis
- Device performance breakdown
- Traffic source analysis
- Revenue per segment

### Color Scheme
- **Control Group**: `#4CAF50` (Green) / `#1f77b4` (Blue)
- **Treatment Group**: `#f44336` (Red) / `#ff7f0e` (Orange)
- **Success/Positive**: `#2ca02c` (Green)
- **Warning/Negative**: `#d62728` (Red)

## Power BI Import Steps

1. **Open Power BI Desktop**
2. **Get Data** → **Text/CSV**
3. **Import these 5 files** from `powerbi_data/`:
   - `ab_test_summary.csv` — Key metrics
   - `daily_performance.csv` — Time series
   - `confidence_intervals.csv` — Statistical data
   - `segment_analysis.csv` — Breakdowns
   - `raw_user_sample.csv` — User details
4. **Create visuals** following `PowerBI_Visualization_Guide.md`

## Statistical Methods

| Method | Binary | Continuous |
|--------|--------|-----------|
| Significance test | Two-proportion z-test | Welch's t-test |
| Confidence intervals | Wilson score | Normal approximation |
| Effect size | Cohen's h | Cohen's d |
| Bayesian model | Beta-binomial conjugate | Normal MC simulation |
| Power analysis | Exact binomial | Normal approximation |

## Real Data Integration

### Excel Integration
```python
import pandas as pd
df = pd.read_excel('your_data.xlsx')
# Extract counts and plug into Section 1 of ab_test_version_28_02_2026.ipynb
```

### Database Connection
```python
import sqlalchemy
df = pd.read_sql(your_ab_test_query, connection)
```

### CSV Import
```python
df = pd.read_csv('your_ab_test_data.csv')
```

## Troubleshooting

| Issue | Solution |
|-------|----------|
| CSV files not created | Run `ab_test_template.ipynb` (the template handles Power BI export) |
| Power BI can't open files | Check paths; ensure CSVs are in `powerbi_data/` |
| Numbers don't match | Verify data input in Section 1; re-run all cells |
| Charts look wrong | Follow visual configurations in `PowerBI_Visualization_Guide.md` |