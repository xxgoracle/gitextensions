@echo off
REM Run Prepare-Release.ps1 instead to make a portable build.  This script is called by that script
REM To make a portable build run either of these commands and then this script
REM .\Set-Portable.ps1 -IsPortable
REM .\Set-Portable.ps Debug -IsPortable

cd /d "%~p0"

SET Configuration=%1
IF "%Configuration%"=="" SET Configuration=Release
SET TfmConfiguration=%2
IF "%TfmConfiguration%"=="" SET TfmConfiguration="%Configuration%\net461"
SET version=%3
if not "%APPVEYOR_BUILD_VERSION%"=="" set version=%APPVEYOR_BUILD_VERSION%

rd /q /s GitExtensions\ 2>nul

REM Some plugins are not included, like TeamFoundation/TfsIntegration with related dlls

REM .net Standard
echo ".NET Standard libraries"
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Microsoft.Win32.Primitives.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\netstandard.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.AppContext.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Collections.Concurrent.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Collections.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Collections.NonGeneric.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Collections.Specialized.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.ComponentModel.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.ComponentModel.EventBasedAsync.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.ComponentModel.Primitives.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.ComponentModel.TypeConverter.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Composition.AttributedModel.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Composition.Convention.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Composition.Hosting.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Composition.Runtime.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Composition.TypedParts.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Console.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Data.Common.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Diagnostics.Contracts.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Diagnostics.Debug.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Diagnostics.FileVersionInfo.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Diagnostics.Process.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Diagnostics.StackTrace.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Diagnostics.TextWriterTraceListener.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Diagnostics.Tools.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Diagnostics.TraceSource.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Diagnostics.Tracing.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Drawing.Primitives.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Dynamic.Runtime.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Globalization.Calendars.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Globalization.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Globalization.Extensions.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.IO.Compression.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.IO.Compression.ZipFile.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.IO.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.IO.FileSystem.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.IO.FileSystem.DriveInfo.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.IO.FileSystem.Primitives.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.IO.FileSystem.Watcher.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.IO.IsolatedStorage.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.IO.MemoryMappedFiles.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.IO.Pipes.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.IO.UnmanagedMemoryStream.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Linq.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Linq.Expressions.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Linq.Parallel.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Linq.Queryable.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Net.Http.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Net.NameResolution.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Net.NetworkInformation.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Net.Ping.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Net.Primitives.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Net.Requests.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Net.Security.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Net.Sockets.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Net.WebHeaderCollection.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Net.WebSockets.Client.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Net.WebSockets.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.ObjectModel.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Reflection.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Reflection.Extensions.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Reflection.Primitives.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Resources.Reader.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Resources.ResourceManager.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Resources.Writer.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Runtime.CompilerServices.VisualC.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Runtime.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Runtime.Extensions.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Runtime.Handles.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Runtime.InteropServices.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Runtime.Numerics.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Runtime.Serialization.Formatters.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Runtime.Serialization.Json.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Runtime.Serialization.Primitives.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Runtime.Serialization.Xml.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Security.Claims.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Security.Cryptography.Algorithms.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Security.Cryptography.Csp.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Security.Cryptography.Encoding.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Security.Cryptography.Primitives.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Security.Cryptography.X509Certificates.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Security.Principal.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Security.SecureString.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Text.Encoding.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Text.Encoding.Extensions.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Text.RegularExpressions.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Threading.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Threading.Overlapped.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Threading.Tasks.Dataflow.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Threading.Tasks.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Threading.Tasks.Parallel.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Threading.Thread.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Threading.ThreadPool.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Threading.Timer.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Xml.ReaderWriter.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Xml.XDocument.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Xml.XmlDocument.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Xml.XmlSerializer.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Xml.XPath.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Xml.XPath.XDocument.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1

REM Resources from dependencies
echo "Resource libs"
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\cs\Microsoft.VisualStudio.Composition.resources.dll GitExtensions\cs\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\cs\Microsoft.VisualStudio.Threading.resources.dll GitExtensions\cs\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\cs\Microsoft.VisualStudio.Validation.resources.dll GitExtensions\cs\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\de\Microsoft.VisualStudio.Composition.resources.dll GitExtensions\de\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\de\Microsoft.VisualStudio.Threading.resources.dll GitExtensions\de\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\de\Microsoft.VisualStudio.Validation.resources.dll GitExtensions\de\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\es\Microsoft.VisualStudio.Composition.resources.dll GitExtensions\es\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\es\Microsoft.VisualStudio.Threading.resources.dll GitExtensions\es\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\es\Microsoft.VisualStudio.Validation.resources.dll GitExtensions\es\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\fr\Microsoft.VisualStudio.Composition.resources.dll GitExtensions\fr\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\fr\Microsoft.VisualStudio.Threading.resources.dll GitExtensions\fr\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\fr\Microsoft.VisualStudio.Validation.resources.dll GitExtensions\fr\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\it\Microsoft.VisualStudio.Composition.resources.dll GitExtensions\it\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\it\Microsoft.VisualStudio.Threading.resources.dll GitExtensions\it\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\it\Microsoft.VisualStudio.Validation.resources.dll GitExtensions\it\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\ja\Microsoft.VisualStudio.Composition.resources.dll GitExtensions\ja\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\ja\Microsoft.VisualStudio.Threading.resources.dll GitExtensions\ja\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\ja\Microsoft.VisualStudio.Validation.resources.dll GitExtensions\ja\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\ko\Microsoft.VisualStudio.Composition.resources.dll GitExtensions\ko\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\ko\Microsoft.VisualStudio.Threading.resources.dll GitExtensions\ko\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\ko\Microsoft.VisualStudio.Validation.resources.dll GitExtensions\ko\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\pl\Microsoft.VisualStudio.Composition.resources.dll GitExtensions\pl\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\pl\Microsoft.VisualStudio.Threading.resources.dll GitExtensions\pl\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\pl\Microsoft.VisualStudio.Validation.resources.dll GitExtensions\pl\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\cs\Microsoft.TeamFoundation.Common.resources.dll GitExtensions\Plugins\cs\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\cs\Microsoft.TeamFoundation.Core.WebApi.resources.dll GitExtensions\Plugins\cs\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\cs\Microsoft.VisualStudio.Services.Common.resources.dll GitExtensions\Plugins\cs\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\cs\Microsoft.VisualStudio.Services.WebApi.resources.dll GitExtensions\Plugins\cs\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\de\Microsoft.TeamFoundation.Common.resources.dll GitExtensions\Plugins\de\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\de\Microsoft.TeamFoundation.Core.WebApi.resources.dll GitExtensions\Plugins\de\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\de\Microsoft.TeamFoundation.Dashboards.WebApi.resources.dll GitExtensions\Plugins\de\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\de\Microsoft.VisualStudio.Services.Common.resources.dll GitExtensions\Plugins\de\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\de\Microsoft.VisualStudio.Services.WebApi.resources.dll GitExtensions\Plugins\de\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\es\Microsoft.TeamFoundation.Common.resources.dll GitExtensions\Plugins\es\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\es\Microsoft.TeamFoundation.Core.WebApi.resources.dll GitExtensions\Plugins\es\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\es\Microsoft.TeamFoundation.Dashboards.WebApi.resources.dll GitExtensions\Plugins\es\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\es\Microsoft.VisualStudio.Services.Common.resources.dll GitExtensions\Plugins\es\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\es\Microsoft.VisualStudio.Services.WebApi.resources.dll GitExtensions\Plugins\es\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\fr\Microsoft.TeamFoundation.Common.resources.dll GitExtensions\Plugins\fr\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\fr\Microsoft.TeamFoundation.Core.WebApi.resources.dll GitExtensions\Plugins\fr\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\fr\Microsoft.TeamFoundation.Dashboards.WebApi.resources.dll GitExtensions\Plugins\fr\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\fr\Microsoft.VisualStudio.Services.Common.resources.dll GitExtensions\Plugins\fr\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\fr\Microsoft.VisualStudio.Services.WebApi.resources.dll GitExtensions\Plugins\fr\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\it\Microsoft.TeamFoundation.Common.resources.dll GitExtensions\Plugins\it\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\it\Microsoft.TeamFoundation.Core.WebApi.resources.dll GitExtensions\Plugins\it\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\it\Microsoft.TeamFoundation.Dashboards.WebApi.resources.dll GitExtensions\Plugins\it\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\it\Microsoft.VisualStudio.Services.Common.resources.dll GitExtensions\Plugins\it\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\it\Microsoft.VisualStudio.Services.WebApi.resources.dll GitExtensions\Plugins\it\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\ja\Microsoft.TeamFoundation.Common.resources.dll GitExtensions\Plugins\ja\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\ja\Microsoft.TeamFoundation.Core.WebApi.resources.dll GitExtensions\Plugins\ja\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\ja\Microsoft.TeamFoundation.Dashboards.WebApi.resources.dll GitExtensions\Plugins\ja\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\ja\Microsoft.VisualStudio.Services.Common.resources.dll GitExtensions\Plugins\ja\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\ja\Microsoft.VisualStudio.Services.WebApi.resources.dll GitExtensions\Plugins\ja\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\ko\Microsoft.TeamFoundation.Common.resources.dll GitExtensions\Plugins\ko\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\ko\Microsoft.TeamFoundation.Core.WebApi.resources.dll GitExtensions\Plugins\ko\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\ko\Microsoft.TeamFoundation.Dashboards.WebApi.resources.dll GitExtensions\Plugins\ko\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\ko\Microsoft.VisualStudio.Services.Common.resources.dll GitExtensions\Plugins\ko\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\ko\Microsoft.VisualStudio.Services.WebApi.resources.dll GitExtensions\Plugins\ko\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\pl\Microsoft.TeamFoundation.Common.resources.dll GitExtensions\Plugins\pl\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\pl\Microsoft.TeamFoundation.Core.WebApi.resources.dll GitExtensions\Plugins\pl\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\pl\Microsoft.VisualStudio.Services.Common.resources.dll GitExtensions\Plugins\pl\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\pl\Microsoft.VisualStudio.Services.WebApi.resources.dll GitExtensions\Plugins\pl\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\pt-BR\Microsoft.TeamFoundation.Common.resources.dll GitExtensions\Plugins\pt-BR\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\pt-BR\Microsoft.TeamFoundation.Core.WebApi.resources.dll GitExtensions\Plugins\pt-BR\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\pt-BR\Microsoft.VisualStudio.Services.Common.resources.dll GitExtensions\Plugins\pt-BR\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\pt-BR\Microsoft.VisualStudio.Services.WebApi.resources.dll GitExtensions\Plugins\pt-BR\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\ru\Microsoft.TeamFoundation.Common.resources.dll GitExtensions\Plugins\ru\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\ru\Microsoft.TeamFoundation.Core.WebApi.resources.dll GitExtensions\Plugins\ru\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\ru\Microsoft.TeamFoundation.Dashboards.WebApi.resources.dll GitExtensions\Plugins\ru\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\ru\Microsoft.VisualStudio.Services.Common.resources.dll GitExtensions\Plugins\ru\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\ru\Microsoft.VisualStudio.Services.WebApi.resources.dll GitExtensions\Plugins\ru\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\tr\Microsoft.TeamFoundation.Common.resources.dll GitExtensions\Plugins\tr\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\tr\Microsoft.TeamFoundation.Core.WebApi.resources.dll GitExtensions\Plugins\tr\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\tr\Microsoft.TeamFoundation.Dashboards.WebApi.resources.dll GitExtensions\Plugins\tr\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\tr\Microsoft.VisualStudio.Services.Common.resources.dll GitExtensions\Plugins\tr\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\tr\Microsoft.VisualStudio.Services.WebApi.resources.dll GitExtensions\Plugins\tr\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\zh-Hans\Microsoft.TeamFoundation.Common.resources.dll GitExtensions\Plugins\zh-Hans\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\zh-Hans\Microsoft.TeamFoundation.Core.WebApi.resources.dll GitExtensions\Plugins\zh-Hans\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\zh-Hans\Microsoft.TeamFoundation.Dashboards.WebApi.resources.dll GitExtensions\Plugins\zh-Hans\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\zh-Hans\Microsoft.VisualStudio.Services.Common.resources.dll GitExtensions\Plugins\zh-Hans\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\zh-Hans\Microsoft.VisualStudio.Services.WebApi.resources.dll GitExtensions\Plugins\zh-Hans\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\zh-Hant\Microsoft.TeamFoundation.Common.resources.dll GitExtensions\Plugins\zh-Hant\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\zh-Hant\Microsoft.TeamFoundation.Core.WebApi.resources.dll GitExtensions\Plugins\zh-Hant\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\zh-Hant\Microsoft.TeamFoundation.Dashboards.WebApi.resources.dll GitExtensions\Plugins\zh-Hant\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\zh-Hant\Microsoft.VisualStudio.Services.Common.resources.dll GitExtensions\Plugins\zh-Hant\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\zh-Hant\Microsoft.VisualStudio.Services.WebApi.resources.dll GitExtensions\Plugins\zh-Hant\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\pt-BR\Microsoft.VisualStudio.Composition.resources.dll GitExtensions\pt-BR\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\pt-BR\Microsoft.VisualStudio.Threading.resources.dll GitExtensions\pt-BR\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\pt-BR\Microsoft.VisualStudio.Validation.resources.dll GitExtensions\pt-BR\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\ru\Microsoft.VisualStudio.Composition.resources.dll GitExtensions\ru\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\ru\Microsoft.VisualStudio.Threading.resources.dll GitExtensions\ru\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\ru\Microsoft.VisualStudio.Validation.resources.dll GitExtensions\ru\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\tr\Microsoft.VisualStudio.Composition.resources.dll GitExtensions\tr\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\tr\Microsoft.VisualStudio.Threading.resources.dll GitExtensions\tr\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\tr\Microsoft.VisualStudio.Validation.resources.dll GitExtensions\tr\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\zh-Hans\Microsoft.VisualStudio.Composition.resources.dll GitExtensions\zh-Hans\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\zh-Hans\Microsoft.VisualStudio.Threading.resources.dll GitExtensions\zh-Hans\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\zh-Hans\Microsoft.VisualStudio.Validation.resources.dll GitExtensions\zh-Hans\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\zh-Hant\Microsoft.VisualStudio.Composition.resources.dll GitExtensions\zh-Hant\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\zh-Hant\Microsoft.VisualStudio.Threading.resources.dll GitExtensions\zh-Hant\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\zh-Hant\Microsoft.VisualStudio.Validation.resources.dll GitExtensions\zh-Hant\
IF ERRORLEVEL 1 EXIT /B 1 


REM Main output
echo "main output"
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\ConEmu GitExtensions\ConEmu
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\ConEmu.WinForms.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Git.hub.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\GitCommands.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\GitExtUtils.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\AdysTech.CredentialManager.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\GitExtensions.exe GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\GitExtensions.exe.config GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\GitUI.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.IO.Abstractions.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.ValueTuple.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\GitUIPluginInterfaces.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\bin\ICSharpCode.SharpZipLib.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\ICSharpCode.TextEditor.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\AppInsights.WindowsDesktop.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Microsoft.ApplicationInsights.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Microsoft.WindowsAPICodePack.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Microsoft.WindowsAPICodePack.Shell.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\SmartFormat.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Ben.Demystifier.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\NetSpell.SpellChecker.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\PSTaskDialog.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\ResourceManager.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Microsoft.VisualStudio.Composition.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Microsoft.VisualStudio.Threading.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Microsoft.VisualStudio.Validation.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\System.Runtime.InteropServices.RuntimeInformation.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1

REM Plugins
echo "Plugins"

echo xcopy /y /i ..\Plugins\AutoCompileSubmodules\bin\%Configuration%\AutoCompileSubmodules.dll GitExtensions\Plugins\
xcopy /y /i ..\Plugins\AutoCompileSubmodules\bin\%Configuration%\AutoCompileSubmodules.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\BackgroundFetch\bin\%Configuration%\BackgroundFetch.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\BackgroundFetch\bin\%Configuration%\System.Reactive.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\BackgroundFetch\bin\%Configuration%\System.Reactive.Interfaces.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\BackgroundFetch\bin\%Configuration%\System.Reactive.Linq.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\Bitbucket\bin\%Configuration%\Bitbucket.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\BuildServerIntegration\AppVeyorIntegration\bin\%Configuration%\AppVeyorIntegration.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\BuildServerIntegration\JenkinsIntegration\bin\%Configuration%\JenkinsIntegration.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\BuildServerIntegration\TeamCityIntegration\bin\%Configuration%\TeamCityIntegration.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\BuildServerIntegration\AzureDevOpsIntegration\bin\%Configuration%\AzureDevOpsIntegration.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\CreateLocalBranches\bin\%Configuration%\CreateLocalBranches.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\DeleteUnusedBranches\bin\%Configuration%\DeleteUnusedBranches.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\FindLargeFiles\bin\%Configuration%\FindLargeFiles.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\Gerrit\bin\%Configuration%\Gerrit.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\Gerrit\bin\%Configuration%\Newtonsoft.Json.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\GitFlow\bin\%Configuration%\GitFlow.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\Github3\bin\%Configuration%\RestSharp.dll GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\Github3\bin\%Configuration%\Github3.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\Gource\bin\%Configuration%\Gource.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\JiraCommitHintPlugin\bin\%Configuration%\Atlassian.Jira.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\JiraCommitHintPlugin\bin\%Configuration%\JiraCommitHintPlugin.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\JiraCommitHintPlugin\bin\%Configuration%\NString.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\JiraCommitHintPlugin\bin\%Configuration%\System.Collections.Immutable.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\ProxySwitcher\bin\%Configuration%\ProxySwitcher.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\ReleaseNotesGenerator\bin\%Configuration%\ReleaseNotesGenerator.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\Statistics\GitImpact\bin\%Configuration%\GitImpact.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\Statistics\GitStatistics\bin\%Configuration%\GitStatistics.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\GitUIPluginInterfaces.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\JetBrains.Annotations.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\Microsoft.TeamFoundation.Build.Client.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\Microsoft.TeamFoundation.Build2.WebApi.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\Microsoft.TeamFoundation.Chat.WebApi.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\Microsoft.TeamFoundation.Client.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\Microsoft.TeamFoundation.Common.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\Microsoft.TeamFoundation.Core.WebApi.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\Microsoft.TeamFoundation.Dashboards.WebApi.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\Microsoft.TeamFoundation.DistributedTask.Common.Contracts.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\Microsoft.TeamFoundation.Policy.WebApi.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\Microsoft.TeamFoundation.SourceControl.WebApi.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\Microsoft.TeamFoundation.Test.WebApi.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\Microsoft.TeamFoundation.TestManagement.WebApi.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\Microsoft.TeamFoundation.Work.WebApi.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\Microsoft.TeamFoundation.WorkItemTracking.WebApi.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\Microsoft.VisualStudio.Services.Common.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\Microsoft.VisualStudio.Services.WebApi.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\Newtonsoft.Json.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\System.Net.Http.Formatting.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\TfsIntegration.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\TfsInterop.Vs2012.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\TfsInterop.Vs2013.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\TfsInterop.Vs2015.dll GitExtensions\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 

REM UserPlugins
echo "UserPlugins"

xcopy /y /e ..\Plugins\GitExtensions.PluginManager\Output GitExtensions\UserPlugins\GitExtensions.PluginManager\
IF ERRORLEVEL 1 EXIT /B 1

REM Translation
echo "Translation"
xcopy /y /i ..\GitUI\Translation\English.gif GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitUI\Translation\English.xlf GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitUI\Translation\English.Plugins.xlf GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i ..\GitUI\Translation\Czech.gif GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i ..\GitUI\Translation\Czech.xlf GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i ..\GitUI\Translation\Czech.Plugins.xlf GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitUI\Translation\Dutch.gif GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitUI\Translation\Dutch.xlf GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitUI\Translation\Dutch.Plugins.xlf GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitUI\Translation\French.gif GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitUI\Translation\French.xlf GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitUI\Translation\French.Plugins.xlf GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitUI\Translation\German.gif GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitUI\Translation\German.xlf GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitUI\Translation\German.Plugins.xlf GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i ..\GitUI\Translation\Italian.gif GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i ..\GitUI\Translation\Italian.xlf GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i ..\GitUI\Translation\Italian.Plugins.xlf GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i ..\GitUI\Translation\Japanese.gif GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i ..\GitUI\Translation\Japanese.xlf GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i ..\GitUI\Translation\Japanese.Plugins.xlf GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i ..\GitUI\Translation\Korean.gif GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i ..\GitUI\Translation\Korean.xlf GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i ..\GitUI\Translation\Korean.Plugins.xlf GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitUI\Translation\Polish.gif GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitUI\Translation\Polish.xlf GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitUI\Translation\Polish.Plugins.xlf GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitUI\Translation\Russian.gif GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitUI\Translation\Russian.xlf GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitUI\Translation\Russian.Plugins.xlf GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i "..\GitUI\Translation\Simplified Chinese.gif" GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i "..\GitUI\Translation\Simplified Chinese.xlf" GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i "..\GitUI\Translation\Simplified Chinese.Plugins.xlf" GitExtensions\Translation\
IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i ..\GitUI\Translation\Spanish.gif GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i ..\GitUI\Translation\Spanish.xlf GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i ..\GitUI\Translation\Spanish.Plugins.xlf GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i "..\GitUI\Translation\Traditional Chinese.gif" GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i "..\GitUI\Translation\Traditional Chinese.xlf" GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i "..\GitUI\Translation\Traditional Chinese.Plugins.xlf" GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1
REM xcopy /y /i "..\GitExtensions\bin\%TfmConfiguration%\Translation\Portuguese (Brazil).gif" GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1 
REM xcopy /y /i "..\GitExtensions\bin\%TfmConfiguration%\Translation\Portuguese (Portugal).gif" GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1 
REM xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Translation\Romanian.gif GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1 
REM xcopy /y /i "..\GitExtensions\bin\%TfmConfiguration%\Translation\Portuguese (Brazil).Plugins.xlf" GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1 
REM xcopy /y /i "..\GitExtensions\bin\%TfmConfiguration%\Translation\Portuguese (Brazil).xlf" GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1 
REM xcopy /y /i "..\GitExtensions\bin\%TfmConfiguration%\Translation\Portuguese (Portugal).Plugins.xlf" GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1 
REM xcopy /y /i "..\GitExtensions\bin\%TfmConfiguration%\Translation\Portuguese (Portugal).xlf" GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1 
REM xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Translation\Romanian.Plugins.xlf GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1 
REM xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Translation\Romanian.xlf GitExtensions\Translation\
REM IF ERRORLEVEL 1 EXIT /B 1 



REM Dictionaries
echo "Dictionaries"
xcopy /y /i ..\bin\Dictionaries GitExtensions\Dictionaries\
IF ERRORLEVEL 1 EXIT /B 1
REM Diff scripts
echo "Diff scripts"
xcopy /y /i ..\bin\Diff-Scripts\merge-* GitExtensions\Diff-Scripts\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\bin\Diff-Scripts\*.txt GitExtensions\Diff-Scripts\
IF ERRORLEVEL 1 EXIT /B 1

REM PUTTY
echo "Putty"
xcopy /y /i ..\bin\pageant.exe GitExtensions\PuTTY\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\bin\plink.exe GitExtensions\PuTTY\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\bin\puttygen.exe GitExtensions\PuTTY\
IF ERRORLEVEL 1 EXIT /B 1

REM LOGO
echo "logo"
xcopy /y /i ..\Logo\git-extensions-logo.ico GitExtensions\
IF ERRORLEVEL 1 EXIT /B 1

REM PDB's
echo "PDB files"
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\ConEmu.WinForms.pdb GitExtensions-pdbs\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Git.hub.pdb GitExtensions-pdbs\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\GitCommands.pdb GitExtensions-pdbs\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\GitExtUtils.pdb GitExtensions-pdbs\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\GitExtensions.pdb GitExtensions-pdbs\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\GitUI.pdb GitExtensions-pdbs\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\GitUIPluginInterfaces.pdb GitExtensions-pdbs\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\NetSpell.SpellChecker.pdb GitExtensions-pdbs\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\ResourceManager.pdb GitExtensions-pdbs\
IF ERRORLEVEL 1 EXIT /B 1

xcopy /y /i ..\Plugins\AutoCompileSubmodules\bin\%Configuration%\AutoCompileSubmodules.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\BackgroundFetch\bin\%Configuration%\BackgroundFetch.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\Bitbucket\bin\%Configuration%\Bitbucket.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\BuildServerIntegration\AppVeyorIntegration\bin\%Configuration%\AppVeyorIntegration.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\BuildServerIntegration\JenkinsIntegration\bin\%Configuration%\JenkinsIntegration.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\BuildServerIntegration\TeamCityIntegration\bin\%Configuration%\TeamCityIntegration.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\BuildServerIntegration\AzureDevOpsIntegration\bin\%Configuration%\AzureDevOpsIntegration.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\CreateLocalBranches\bin\%Configuration%\CreateLocalBranches.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\DeleteUnusedBranches\bin\%Configuration%\DeleteUnusedBranches.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\FindLargeFiles\bin\%Configuration%\FindLargeFiles.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\Gerrit\bin\%Configuration%\Gerrit.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\GitFlow\bin\%Configuration%\GitFlow.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\Github3\bin\%Configuration%\Github3.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\Gource\bin\%Configuration%\Gource.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\JiraCommitHintPlugin\bin\%Configuration%\JiraCommitHintPlugin.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\ProxySwitcher\bin\%Configuration%\ProxySwitcher.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\ReleaseNotesGenerator\bin\%Configuration%\ReleaseNotesGenerator.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\Statistics\GitImpact\bin\%Configuration%\GitImpact.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\Plugins\Statistics\GitStatistics\bin\%Configuration%\GitStatistics.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\ICSharpCode.TextEditor.pdb GitExtensions-pdbs\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\SmartFormat.pdb GitExtensions-pdbs\
IF ERRORLEVEL 1 EXIT /B 1
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\GitUIPluginInterfaces.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\TfsIntegration.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\TfsInterop.Vs2012.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\TfsInterop.Vs2013.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 
xcopy /y /i ..\GitExtensions\bin\%TfmConfiguration%\Plugins\TfsInterop.Vs2015.pdb GitExtensions-pdbs\Plugins\
IF ERRORLEVEL 1 EXIT /B 1 

powershell.exe -executionpolicy Bypass -File  .\Get-Hashes.ps1 > Hashes.txt
move Hashes.txt GitExtensions\

set nuget=..\.nuget\nuget.exe
%nuget% update -self
%nuget% install ..\.nuget\packages.config -OutputDirectory ..\packages -Verbosity Quiet

set portable=GitExtensions-Portable-%version%.zip
set pdbs=GitExtensions-pdbs-%version%.zip

del %portable% 2>nul
del %pdbs% 2>nul

set szip="..\packages\7-Zip.CommandLine.9.20.0\tools\7za"
%szip% a -tzip %portable% GitExtensions
IF ERRORLEVEL 1 EXIT /B 1
%szip% a -tzip %pdbs% .\GitExtensions-pdbs\*
IF ERRORLEVEL 1 EXIT /B 1
