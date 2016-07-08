# Media Monkey Scripts

## To use

Copy the script to the scripts directory.  On my Win7 machine the media money scripts directory is 

```
C:\Program Files (x86)\MediaMonkey\Scripts
```

For example, if you were copying the PrependTitle Script you would have a 

```
C:\Program Files (x86)\MediaMonkey\Scripts\PrependTitle.vbs
```

Next update the Scripts.ini file in the scripts directory and add an entry.  For example, when adding the PrependTitle script you would add this to Scripits.ini:

```
[PrependTitle]
FileName=PrependTitle.vbs
ProcName=PrependTitle
Order=10
DisplayName=Prepend Title
Description=Prepend Title with String
Language=VBScript
ScriptType=0
```

FIXME: provide script to add this text to Scripts.ini and add .vbs flle automatically.
