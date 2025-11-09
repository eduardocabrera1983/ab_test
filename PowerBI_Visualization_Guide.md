# 🎨 Power BI Dashboard Templates for AB Testing

This guide provides specific templates for creating professional AB test dashboards using the exported data.

## 📊 Dashboard Structure (4 Pages)

### 🏠 Page 1: Executive Summary
**Purpose:** High-level overview for stakeholders

#### Key Visuals:
1. **KPI Cards Row** (Top of page)
   - Control Conversion Rate
   - Treatment Conversion Rate  
   - Relative Improvement %
   - P-Value

2. **Main Chart** (Center)
   - Clustered Column Chart: Conversion Rate by Group
   - Add error bars for confidence intervals
   - Format: Percentage with 2 decimals

3. **Statistical Significance Indicator**
   - Card visual or gauge
   - Green if p < 0.05, Red if not significant
   - Add conditional formatting

4. **Summary Text Box**
   - "Test Result: [Winner/Loser/Inconclusive]"
   - Key recommendation

#### Visual Configuration:
```
Conversion Rate Comparison Chart:
- Data: confidence_intervals.csv
- X-axis: Group
- Y-axis: Conversion_Rate
- Error bars: CI_Lower, CI_Upper
- Colors: Control=#1f77b4, Treatment=#ff7f0e
```

---

### 📈 Page 2: Statistical Analysis
**Purpose:** Detailed analysis for analysts

#### Key Visuals:
1. **Statistical Summary Table**
   - Table visual with all key metrics
   - Conditional formatting for significance

2. **Confidence Intervals Chart**
   - Error bar chart showing overlap
   - Clustered column with error bars

3. **Effect Size Gauge**
   - Gauge visual showing Cohen's h
   - Ranges: Small (0-0.2), Medium (0.2-0.5), Large (>0.5)

4. **Power Analysis Card**
   - Shows statistical power percentage
   - Target line at 80%

#### DAX Measures:
```dax
// Key measures for this page
Statistical Significance = 
IF(
    VALUE(LOOKUPVALUE('Summary'[Value], 'Summary'[Metric], "P Value")) < 0.05,
    "✓ Significant",
    "✗ Not Significant"
)

Effect Size Category = 
VAR EffectSize = VALUE(LOOKUPVALUE('Summary'[Value], 'Summary'[Metric], "Effect Size (Cohen h)"))
RETURN
SWITCH(
    TRUE(),
    ABS(EffectSize) < 0.2, "Small",
    ABS(EffectSize) < 0.5, "Medium", 
    "Large"
)
```

---

### 📅 Page 3: Time Series Analysis
**Purpose:** Performance trends over time

#### Key Visuals:
1. **Daily Conversion Trends**
   - Line chart: Date vs Conversion Rate
   - Two lines for Control/Treatment
   - Add trend lines

2. **Daily Volume Chart** 
   - Area chart: Users per day by group
   - Stacked or side-by-side

3. **Weekday Performance**
   - Matrix or heatmap
   - Rows: Weekday, Columns: Group
   - Values: Conversion Rate

4. **Cumulative Results**
   - Line chart showing cumulative significance
   - Running totals over time

#### Visual Configuration:
```
Daily Trends Chart:
- Data: daily_performance.csv  
- X-axis: Date
- Y-axis: Conversion_Rate
- Legend: Group
- Line colors: Control=#1f77b4, Treatment=#ff7f0e
- Add data labels for final values
```

---

### 👥 Page 4: Segment Analysis
**Purpose:** Performance by user segments

#### Key Visuals:
1. **Device Performance**
   - Clustered column: Conversion Rate by Device and Group
   - Shows which devices respond better to treatment

2. **Traffic Source Analysis**
   - Matrix visual: Traffic Source × Group
   - Conditional formatting on conversion rates

3. **Revenue Analysis**
   - Scatter plot: Users vs Revenue by Group
   - Size = Conversion Rate

4. **User Drill-Through Table**
   - Detailed user-level data
   - Set up drill-through from other visuals

#### Segment Performance DAX:
```dax
// Segment performance measures
Device Winner = 
VAR ControlRate = CALCULATE([Avg Conversion Rate], 'Segments'[Group] = "Control")
VAR TreatmentRate = CALCULATE([Avg Conversion Rate], 'Segments'[Group] = "Treatment")
RETURN
IF(TreatmentRate > ControlRate, "Treatment Better", "Control Better")

Segment Improvement = 
VAR ControlRate = CALCULATE([Avg Conversion Rate], 'Segments'[Group] = "Control")
VAR TreatmentRate = CALCULATE([Avg Conversion Rate], 'Segments'[Group] = "Treatment")
RETURN
DIVIDE(TreatmentRate - ControlRate, ControlRate, 0) * 100
```

## 🎨 Design Guidelines

### Color Scheme:
- **Control Group:** `#1f77b4` (Professional Blue)
- **Treatment Group:** `#ff7f0e` (Orange)
- **Success/Positive:** `#2ca02c` (Green)
- **Warning/Negative:** `#d62728` (Red)
- **Neutral:** `#7f7f7f` (Gray)

### Typography:
- **Headers:** Segoe UI, Bold, 16pt
- **Subheaders:** Segoe UI, Semi-bold, 12pt  
- **Body text:** Segoe UI, Regular, 10pt
- **Data labels:** Segoe UI, Regular, 9pt

### Layout Principles:
1. **F-Pattern:** Most important info top-left
2. **Hierarchy:** Use size/color to show importance
3. **White space:** Don't overcrowd visuals
4. **Consistency:** Same chart types for same data

## 📏 Specific Visual Settings

### KPI Cards:
```
Format Settings:
- Category label: Off
- Title: On, Bold
- Data label: Large, Bold
- Background: Light gray (#f8f9fa)
- Border: None
- Font size: Title 12pt, Value 24pt
```

### Charts:
```
Column Charts:
- Data labels: On, Outside end
- Grid lines: Major horizontal only
- Legend: Bottom, horizontal
- Axis titles: On
- Padding: 10px all sides

Line Charts:
- Markers: On
- Line width: 3px
- Data labels: End points only
- X-axis: Categorical, no gaps
- Y-axis: Start at zero
```

### Tables:
```
Formatting:
- Alternating row colors
- Bold headers
- Conditional formatting for significance
- Auto-fit columns
- Show totals where appropriate
```

## 🔄 Interactive Features

### Slicers to Add:
1. **Date Range Slicer**
   - Between style
   - Affects all time-based visuals

2. **Device Filter**
   - List style
   - Multi-select enabled

3. **Traffic Source Filter**
   - Dropdown style
   - Single select

### Cross-Filtering Setup:
- Daily charts filter segment analysis
- Segment selection filters time series
- Summary cards don't filter other visuals

### Drill-Through Configuration:
```
From: Any chart showing aggregated data
To: User detail page
Drill-through fields: Date, Group
Target: raw_user_sample table
```

## 📱 Mobile Optimization

### Mobile Layout (Portrait):
1. **KPI Cards:** 2×2 grid
2. **Main Chart:** Full width, reduced height
3. **Summary:** Text box below chart
4. **Additional:** Swipe for more pages

### Key Mobile Settings:
- Larger fonts (minimum 12pt)
- Touch-friendly buttons
- Simplified visuals
- Essential metrics only

## 🔧 DAX Measures Library

Add these measures to your Power BI model:

```dax
// === CORE METRICS ===
Total Users = COUNTROWS('RawData')
Total Conversions = SUM('RawData'[converted])
Overall Conversion Rate = DIVIDE([Total Conversions], [Total Users], 0)

// === GROUP-SPECIFIC METRICS ===
Control Users = CALCULATE([Total Users], 'RawData'[group] = "Control")
Treatment Users = CALCULATE([Total Users], 'RawData'[group] = "Treatment")
Control Conversion Rate = CALCULATE([Overall Conversion Rate], 'RawData'[group] = "Control")
Treatment Conversion Rate = CALCULATE([Overall Conversion Rate], 'RawData'[group] = "Treatment")

// === PERFORMANCE METRICS ===
Absolute Improvement = [Treatment Conversion Rate] - [Control Conversion Rate]
Relative Improvement % = DIVIDE([Absolute Improvement], [Control Conversion Rate], 0) * 100

// === CONDITIONAL FORMATTING ===
Performance Color = 
SWITCH(
    TRUE(),
    [Relative Improvement %] > 10, "#2ca02c", // Green
    [Relative Improvement %] > 0, "#ffcc00",  // Yellow
    "#d62728" // Red
)

Result Category = 
VAR PValue = VALUE(LOOKUPVALUE('Summary'[Value], 'Summary'[Metric], "P Value"))
VAR Improvement = [Relative Improvement %]
RETURN
SWITCH(
    TRUE(),
    PValue < 0.05 && Improvement > 5, "🎉 Strong Winner",
    PValue < 0.05 && Improvement > 0, "✅ Winner", 
    PValue < 0.05 && Improvement < 0, "🚨 Loser",
    "⏳ Inconclusive"
)

// === REVENUE METRICS ===
Total Revenue = SUM('RawData'[revenue])
Revenue Per User = DIVIDE([Total Revenue], [Total Users], 0)
Control Revenue = CALCULATE([Total Revenue], 'RawData'[group] = "Control")
Treatment Revenue = CALCULATE([Total Revenue], 'RawData'[group] = "Treatment")
Revenue Improvement % = 
VAR ControlRPU = DIVIDE([Control Revenue], [Control Users], 0)
VAR TreatmentRPU = DIVIDE([Treatment Revenue], [Treatment Users], 0)
RETURN DIVIDE(TreatmentRPU - ControlRPU, ControlRPU, 0) * 100
```

## 📋 Dashboard Checklist

Before publishing, verify:

### Data Accuracy:
- [ ] Numbers match notebook output
- [ ] All datasets imported correctly
- [ ] Relationships established properly
- [ ] No missing or null values

### Visual Quality:
- [ ] Consistent color scheme
- [ ] Appropriate chart types
- [ ] Clear axis labels
- [ ] Readable font sizes
- [ ] Proper formatting (percentages, decimals)

### Functionality:
- [ ] Slicers work correctly
- [ ] Cross-filtering behaves as expected
- [ ] Drill-through configured
- [ ] Mobile layout tested
- [ ] Performance is acceptable

### Business Logic:
- [ ] Statistical interpretation is correct
- [ ] Recommendations align with data
- [ ] Confidence intervals displayed
- [ ] Significance clearly indicated

---

**🚀 You're ready to build professional AB test dashboards!**

Use this template as your starting point and customize based on your specific needs.