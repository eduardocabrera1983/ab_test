# A/B Test Statistical Analysis Framework

Universal toolkit for evaluating any A/B test experiment. Supports both **binary metrics** (conversion rates, cage rates, click-through rates) and **continuous metrics** (revenue per user, avg documents per shipment).

## Project Structure

| File | Purpose |
|------|---------|
| `ab_test_version_28_02_2026.ipynb` | **Main analysis notebook** — universal A/B test framework |
| `ab_test_template.ipynb` | Supplementary template with sample data generation & Power BI export |
| `powerbi_data/` | CSV datasets for Power BI dashboards |
| `PowerBI_Setup_Guide.md` | Quick 3-step Power BI import guide |
| `PowerBI_Visualization_Guide.md` | Dashboard creation templates |
| `run_analysis.ps1` | Automation script to execute notebook & export data |
| `setup_template.ps1` | One-click sample data generation |
| `requirements.txt` | Python dependencies |

## Quick Start

### 1. Activate the virtual environment
```powershell
.venv\Scripts\Activate.ps1
```

### 2. Open the main notebook
Open `ab_test_version_28_02_2026.ipynb` in VS Code or Jupyter. Update **Section 1** with your experiment data:

```python
experiment_id = "492470"
experiment_name = "Item Description Notification"
test_duration_days = 17
metric_type = "binary"       # "binary" or "continuous"
metric_name = "Cage Rate"
lower_is_better = True
```

For **binary metrics**, fill in:
```python
control_users = 640
control_conversions = 53
test_users = 1530
test_conversions = 45
```

For **continuous metrics**, fill in:
```python
control_n = 50000
control_mean = 1.2345
control_std = None            # None uses Poisson approximation
test_n = 48000
test_mean = 1.3456
test_std = None
```

### 3. Run all cells
Everything after Section 1 runs automatically and adapts to your data.

## What the Notebook Produces

| Section | Description |
|---------|-------------|
| Derived Values & Validation | Auto-computes rates, differences, direction labels |
| Traffic Allocation Check | Verifies balanced randomization |
| Statistical Significance | Z-test (binary) or Welch's t-test (continuous) |
| Confidence Intervals (95%) | Wilson score (binary) or normal approximation (continuous) |
| Effect Size | Cohen's h (binary) or Cohen's d (continuous) |
| Power Analysis | Current power, MDE, adequacy assessment |
| Bayesian Analysis | Posterior distributions, probability of benefit/harm |
| Sample Size Planning | Future test sizing with duration estimates |
| Visualizations | 4-panel chart saved as `ab_test_results.png` |
| Final Recommendations | Decision framework with actionable next steps |
| Duration Planner | Standalone pre-experiment planning calculator |

## Environment Setup

**Python 3.11.9** virtual environment with the following packages:

- **Statistics:** `numpy`, `scipy`, `statsmodels`
- **Visualization:** `matplotlib`, `seaborn`
- **Data (for template):** `pandas`, `plotly`, `scikit-learn`
- **Jupyter:** `jupyter`, `ipykernel`

### Install from scratch
```powershell
python -m venv .venv
.venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

### Set Python default for VS Code
```powershell
.\set_python_default.ps1
```