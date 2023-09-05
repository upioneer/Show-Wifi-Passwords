<#
    Tx power: Highest
    Preferred band: 5ghz
    Roaming agressiveness: Highest

    References
        https://answers.microsoft.com/en-us/windows/forum/windows_10-networking/roaming-aggressiveness-doesnt-change-anything/52890427-78de-4aa6-9eba-0456041addf3
#>

function get-validvalues {
    $CurrentFormatEnumerationLimit = $FormatEnumerationLimit
    $FormatEnumerationLimit =-1

    Get-NetAdapterAdvancedProperty W*i -DisplayName "Transmit Power" | ft -Wrap -AutoSize DisplayName, DisplayValue, ValidDisplayValues
    Get-NetAdapterAdvancedProperty W*i -DisplayName "Preferred Band" | ft -Wrap -AutoSize DisplayName, DisplayValue, ValidDisplayValues
    Get-NetAdapterAdvancedProperty W*i -DisplayName "Roaming Aggressiveness" | ft -Wrap -AutoSize DisplayName, DisplayValue, ValidDisplayValues

    $FormatEnumerationLimit = $CurrentFormatEnumerationLimit
}

function get-currentvalues {
    Get-NetAdapteradvancedProperty -Name “Wi-Fi” -DisplayName “Transmit Power”
    Get-NetAdapteradvancedProperty -Name “Wi-Fi” -DisplayName “Preferred Band”
    Get-NetAdapteradvancedProperty -Name “Wi-Fi” -DisplayName “Roaming Aggressiveness”
}

# Set Tx power
Set-NetAdapteradvancedProperty -Name “Wi-Fi” -DisplayName “Transmit Power” –DisplayValue “5. Highest”

# Set Preferred band
Set-NetAdapteradvancedProperty -Name “Wi-Fi” -DisplayName “Preferred Band” –DisplayValue “3. Prefer 5GHz band”

# Set Roaming Aggressiveness
Set-NetAdapteradvancedProperty -Name “Wi-Fi” -DisplayName “Roaming Aggressiveness” –DisplayValue “1. Lowest”
Set-NetAdapteradvancedProperty -Name “Wi-Fi” -DisplayName “Roaming Aggressiveness” –DisplayValue “5. Highest”