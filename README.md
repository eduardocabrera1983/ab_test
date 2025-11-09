# AB Test Project Setup

## Environment Setup

You now have a Python 3.11.9 virtual environment set up for your AB test analysis project.

**Note: Python 3.11.9 has been configured as the default interpreter for VS Code projects.**

### Quick Start

1. **Activate the virtual environment:**
   ```powershell
   .venv\Scripts\Activate.ps1
   ```

2. **Verify Python version:**
   ```powershell
   python --version
   # Should show: Python 3.11.9
   ```

3. **Launch Jupyter Notebook:**
   ```powershell
   jupyter notebook
   ```
   Or for JupyterLab:
   ```powershell
   jupyter lab
   ```

### Installed Packages

The following packages are installed and ready to use:

- **Data Analysis & Statistics:**
  - `numpy` - Numerical computing
  - `pandas` - Data manipulation and analysis
  - `scipy` - Scientific computing and statistics
  - `statsmodels` - Statistical modeling

- **Data Visualization:**
  - `matplotlib` - Basic plotting
  - `seaborn` - Statistical data visualization
  - `plotly` - Interactive visualizations

- **Machine Learning:**
  - `scikit-learn` - Machine learning algorithms

- **Jupyter Environment:**
  - `jupyter` - Jupyter Notebook/Lab
  - `ipykernel` - IPython kernel for Jupyter

### Jupyter Kernel

A custom Jupyter kernel named "Python 3.11 (AB Test)" has been installed. When you open Jupyter, you can select this kernel to use your virtual environment.

### Package Management

To add new packages:
```powershell
# Activate environment first
.venv\Scripts\Activate.ps1

# Install new package
pip install package_name

# Update requirements.txt
pip freeze > requirements.txt
```

To install from requirements.txt (on another machine):
```powershell
# Create and activate virtual environment
python -m venv .venv
.venv\Scripts\Activate.ps1

# Install packages
pip install -r requirements.txt
```

### Deactivating

To deactivate the virtual environment:
```powershell
deactivate
```

## Global Python Configuration

Python 3.11.9 has been set as the default interpreter for:
- VS Code projects (all new workspaces)
- Python Launcher (`py` command)
- Jupyter notebooks

To verify your default Python version:
```powershell
python --version  # Should show Python 3.11.9
py --version      # Should show Python 3.11.9
```

If you need to reset or modify these defaults, run:
```powershell
.\set_python_default.ps1
```