# Power BI Setup for A/B Test Analysis

Connect your A/B test analysis to Power BI dashboards.

## What You Need

1. **Power BI Desktop** (free download from Microsoft)
2. **Your analysis** in `ab_test_version_28_02_2026.ipynb` (main notebook) or `ab_test_template.ipynb` (for Power BI CSV export)
3. **CSV data files** in `powerbi_data/`

## 3-Step Setup

### Step 1: Run Your Analysis
1. Open `ab_test_version_28_02_2026.ipynb`
2. Update Section 1 with your experiment data:
   ```python
   experiment_id = "492470"
   experiment_name = "Item Description Notification"
   metric_type = "binary"          # "binary" or "continuous"
   metric_name = "Cage Rate"
   lower_is_better = True

   control_users = 640
   control_conversions = 53
   test_users = 1530
   test_conversions = 45
   ```
3. Run all cells — analysis, charts, and recommendations generated automatically
4. For Power BI CSV export, also run `ab_test_template.ipynb` or `.\setup_template.ps1`

### Step 2: Import to Power BI
1. **Open Power BI Desktop**
2. **Get Data** → **Text/CSV**
3. **Import these 5 files** from `powerbi_data/`:
   - `ab_test_summary.csv` — Main metrics
   - `daily_performance.csv` — Daily trends
   - `confidence_intervals.csv` — Statistical data
   - `segment_analysis.csv` — Device & traffic breakdowns
   - `raw_user_sample.csv` — User-level details

### Step 3: Create Your Dashboard
Use these **pre-built visual recommendations**:

#### Page 1: Executive Summary
- **Card visuals** for key metrics (Control Rate, Test Rate, P-Value)
- **Bar chart** comparing Control vs Test rates
- **Traffic light visual** for statistical significance
- **Text box** with recommendation from your analysis

#### Page 2: Statistical Details
- **Table** showing all summary statistics
- **Error bar chart** with confidence intervals
- **Gauge** showing statistical power
- **Donut chart** for effect size interpretation

#### Page 3: Time Trends
- **Line chart** showing daily conversion rate trends
- **Area chart** for daily user volume
- **Matrix** for weekday vs weekend patterns

#### Page 4: Segment Analysis
- **Clustered column** for device performance
- **Matrix** for traffic source breakdown
- **Scatter plot** for users vs revenue by group

## Quick Color Scheme

| Element | Hex | Color |
|---------|-----|-------|
| Control Group | `#1f77b4` | Blue |
| Treatment Group | `#ff7f0e` | Orange |
| Success/Positive | `#2ca02c` | Green |
| Warning/Negative | `#d62728` | Red |

## Sample DAX Measures

```dax
// Conversion Rate Improvement
Improvement % = 
    DIVIDE(
        [Test Rate] - [Control Rate],
        [Control Rate],
        0
    ) * 100

// Statistical Significance Indicator
Significance = IF([P Value] < 0.05, "Significant", "Not Significant")

// Recommendation Text
Test Result = 
    SWITCH(
        TRUE(),
        [P Value] < 0.05 && [Improvement %] > 0, "Test Winner - Deploy",
        [P Value] < 0.05 && [Improvement %] < 0, "Test Loser - Stop",
        "Inconclusive - Continue"
    )
```

## Updating Your Dashboard

1. **New data arrives:** Update variables in `ab_test_version_28_02_2026.ipynb` Section 1
2. **Re-run analysis:** Execute all cells
3. **Regenerate CSVs:** Run `ab_test_template.ipynb` or `.\setup_template.ps1`
4. **Refresh Power BI:** Data → Refresh

## Sharing Your Dashboard

- **Publish to Power BI Service:** File → Publish
- **Share with stakeholders:** Create app or direct sharing
- **Export reports:** File → Export to PDF/PowerPoint

---

**Pro tip:** Always validate your Power BI numbers against the notebook output to ensure accuracy.