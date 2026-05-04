Windows PowerShell
Copyright (C) Microsoft Corporation. Todos los derechos reservados.

Instale la versión más reciente de PowerShell para obtener nuevas características y mejoras. https://aka.ms/PSWindows

PS C:\Users\mohamed> # 1. Información general del sistema y tipo de BIOS (UEFI o Legacy)
PS C:\Users\mohamed> Get-ComputerInfo -Property CsName, WindowsVersion, OsArchitecture, TotalPhysicalMemory, BiosFirmwareType

CsName          WindowsVersion OsArchitecture BiosFirmwareType
------          -------------- -------------- ----------------
DESKTOP-SK2A2E8 2009           64 bits                    Uefi


PS C:\Users\mohamed>
PS C:\Users\mohamed> # 2. Procesador (CPU)
PS C:\Users\mohamed> Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed

Name                                      NumberOfCores NumberOfLogicalProcessors MaxClockSpeed
----                                      ------------- ------------------------- -------------
Intel(R) Core(TM) i7-10850H CPU @ 2.70GHz             6                        12          2712


PS C:\Users\mohamed>
PS C:\Users\mohamed> # 3. Memoria RAM instalada (total en GB)
PS C:\Users\mohamed> (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB
32
PS C:\Users\mohamed>
PS C:\Users\mohamed> # 4. Detalle de los módulos de RAM (fabricante, velocidad)
PS C:\Users\mohamed> Get-CimInstance Win32_PhysicalMemory | Select-Object Capacity, Speed, Manufacturer, PartNumber

   Capacity Speed Manufacturer PartNumber
   -------- ----- ------------ ----------
17179869184  3200 Micron       8ATF2G64HZ-3G2E1
17179869184  3200 Micron       8ATF2G64HZ-3G2E1


PS C:\Users\mohamed>
PS C:\Users\mohamed> # 5. Tarjeta(s) gráfica(s)
PS C:\Users\mohamed> Get-CimInstance Win32_VideoController | Select-Object Caption, AdapterRAM, DriverVersion

Caption               AdapterRAM DriverVersion
-------               ---------- -------------
Intel(R) UHD Graphics 1073741824 31.0.101.2125
NVIDIA Quadro T1000   4293918720 32.0.15.8195


PS C:\Users\mohamed>
PS C:\Users\mohamed> # 6. Discos duros (modelo, tamaño, tipo)
PS C:\Users\mohamed> Get-Disk | Select-Object Number, FriendlyName, Size, PartitionStyle, BusType


Number         : 0
FriendlyName   : SAMSUNG MZVLB512HBJQ-00007
Size           : 512110190592
PartitionStyle : GPT
BusType        : NVMe



PS C:\Users\mohamed>
PS C:\Users\mohamed> # 7. Adaptadores de red (Ethernet/Wi-Fi)
PS C:\Users\mohamed> Get-NetAdapter -Physical | Select-Object Name, InterfaceDescription, Status, LinkSpeed

Name                      InterfaceDescription                      Status       LinkSpeed
----                      --------------------                      ------       ---------
Red de telefonía móvil 7  EM7421                                    Not Present  0 bps
Wi-Fi                     Intel(R) Wi-Fi 6 AX201 160MHz             Up           390 Mbps
Ethernet                  Intel(R) Ethernet Connection (11) I219-LM Disconnected 0 bps
Red de telefonía móvil 4  EM7421                                    Not Present  0 bps
Red de telefonía móvil 15 EM7421                                    Not Present  0 bps
Red de telefonía móvil 6  EM7421                                    Not Present  0 bps
Red de telefonía móvil 8  EM7421                                    Not Present  0 bps
Red de telefonía móvil 9  EM7421                                    Not Present  0 bps
Red de telefonía móvil 14 EM7421                                    Not Present  0 bps
Red de telefonía móvil 5  EM7421                                    Not Present  0 bps
Red de telefonía móvil 16 EM7421                                    Not Present  0 bps
Red de telefonía móvil    EM7421                                    Not Present  0 bps
Red de telefonía móvil 12 EM7421                                    Not Present  0 bps
Red de telefonía móvil 11 EM7421                                    Not Present  0 bps
Red de telefonía móvil 17 EM7421                                    Not Present  0 bps
Red de telefonía móvil 13 EM7421                                    Not Present  0 bps
Red de telefonía móvil 2  EM7421                                    Not Present  0 bps
Red de telefonía móvil 10 EM7421                                    Not Present  0 bps
Red de telefonía móvil 3  EM7421                                    Not Present  0 bps


PS C:\Users\mohamed>
PS C:\Users\mohamed> # 8. Estado de la batería (opcional, para saber salud)
PS C:\Users\mohamed> Get-CimInstance Win32_Battery | Select-Object Name, DesignCapacity, FullChargeCapacity

Name        DesignCapacity FullChargeCapacity
----        -------------- ------------------
CP763833-01
