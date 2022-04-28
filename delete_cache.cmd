@echo Off

:: con /R looppa in tutti i file di tutte le sottocartelle
echo ---List files .slxc---
for /R %%G in (*.slxc) do (
	:: echo %%~nxG
	echo %%~fG
	:: senza /P non chiede conferma (exp: del /P)
	:: Guida dice che con /Q non chiede conferma, nel dubbio uso anche questo
	del /Q "%%~fG"
)

:: con /D /R looppa in tutte le cartelle e sottocartelle
echo ---List folders---
for /D /R %%G in (*) do (
	echo %%G
	if %%~nxG == slprj (
		echo deleting
		:: /S cancella anche file in cartella e /Q non chiede conferma
		rmdir /S /Q "%%~fG"
	)
)
pause
