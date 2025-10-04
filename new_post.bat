@echo off
set /p fileName=Please enter the file name of the new article:
set /p postName=Please enter the title of the new article:
:: Use WMIC to retrieve date and time
FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
   IF "%%~L"=="" goto s_done
      Set _yyyy=%%L
      Set _mm=00%%J
      Set _dd=00%%G
      Set _hour=00%%H
      SET _minute=00%%I
      SET _second=00%%K
)
:s_done

:: Pad digits with leading zeros
      Set _mm=%_mm:~-2%
      Set _dd=%_dd:~-2%
      Set _hour=%_hour:~-2%
      Set _minute=%_minute:~-2%
      Set _second=%_second:~-2%
Set date=%_yyyy%-%_mm%-%_dd%

Set logtimestamp=%_yyyy%-%_mm%-%_dd% %_hour%:%_minute%:%_second%
cd "%~dp0assets\"
md "%fileName%"
cd ..
cd "%~dp0_posts\"
Set fileName=%date%-%fileName%
type nul>"%fileName%.md"
echo --->"%fileName%.md"
echo title: %postName%>>"%fileName%.md"
echo date: %logtimestamp% +0800>>"%fileName%.md"
echo categories: [] >>"%fileName%.md"
echo tags: []>>"%fileName%.md"
echo --->>"%fileName%.md"

echo ^<!-->>"%fileName%.md"
echo This is a comment and will not be displayed>>"%fileName%.md"
echo --------->>"%fileName%.md"
echo Images need to be displayed using relative paths>>"%fileName%.md"
echo --------->>"%fileName%.md"
echo # This is a level 1 heading>>"%fileName%.md"
echo ## This is a level 2 heading>>"%fileName%.md"
echo ### This is a level 3 heading>>"%fileName%.md"
echo #### This is a level 4 heading>>"%fileName%.md"
echo ##### This is a level 5 heading>>"%fileName%.md"
echo ###### This is a level 6 heading>>"%fileName%.md"
echo **Bold**>>"%fileName%.md"
echo *Italic*>>"%fileName%.md"
echo ***Bold and Italic***>>"%fileName%.md"
echo ~Strikethrough~>>"%fileName%.md"
echo >This is quoted content. Quotes can be nested>>"%fileName%.md"
echo ---Divider>>"%fileName%.md"
echo ![Image alt](image address "Image title")>>"%fileName%.md"
echo [Hyperlink name](hyperlink address "Hyperlink title")>>"%fileName%.md"
echo - Unordered list item>>"%fileName%.md"
echo 1. Ordered list item>>"%fileName%.md"
echo Table header^|Table header^|Table header>>"%fileName%.md"
echo ---^|:--:^|---:>>"%fileName%.md"
echo Content^|Content^|Content>>"%fileName%.md"
echo Content^|Content^|Content>>"%fileName%.md"
echo `Single line code`>>"%fileName%.md"
echo ``` >>"%fileName%.md"
echo Multi-line code>>"%fileName%.md"
echo ```>>"%fileName%.md"
echo Markdown usage guide ends here>>"%fileName%.md"
echo --^>>>"%fileName%.md"
