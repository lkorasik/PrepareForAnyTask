@set remove="true"
@set from="C:\python\CSLint"
@set to="C:\users\lkora\desktop\CSLint"
@set folder="CSLint"

@if "%1"=="-i" (
	@set remove="false"
)

@echo Check destination folder...

@if not exist %to% (
	@mkdir %to%
)

@echo Start copying...

@robocopy /S %from% %to% > nul

@echo Start clean up...

@prepare.py %folder%

@echo Start achiving...

@tar -cf CSLint.zip CSLint

@if %remove%=="true" (
	@rmdir %to% /S /Q
	@echo Delete folder
)

@timeout 5