@set remove="true"
@set from="C:\Files\Code\Python\CSLint"
@set to="C:\users\lev\desktop\CSLint"
@set folder="CSLint"
@set archive_name="CSLint.zip"

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

@prepare.py %to%

@echo Start achiving...

@cd %to%
@cd ..
@tar -cf %archive_name% %folder%

@if %remove%=="true" (
	@rmdir %to% /S /Q
	@echo Delete folder
)

@Echo 

@timeout 5