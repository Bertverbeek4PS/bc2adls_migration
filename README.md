# BC2ADLS Migration Extension

This extension facilitates the migration from the BC2ADLS PTE (Per-Tenant Extension) to the BC2ADLS AppSource extension.

## Overview

The BC2ADLS migration extension automatically transfers all configuration and data from the legacy PTE extension to the new AppSource-based version of Azure Data Lake Storage Export (ADLSE).

## Migration Steps

Follow these steps in order to successfully migrate from the PTE extension to the AppSource extension:

### Step 1: Upgrade the PTE Extension
- Upgrade your existing BC2ADLS PTE extension to **version 27.44.0 or later**

### Step 2: Install the AppSource Extension
- Install the new Azure Data Lake Storage Export (ADLSE) AppSource extension
- The version must be **27.46.0 or later**
- This is the new official extension published by the bc2adls team

### Step 3: Install the Migration Extension
- Install this migration extension (bc2adls_migration)
- The migration will run **automatically** during installation
- All tables and data from the PTE extension will be copied to the AppSource extension:
  - ADLSE Setup
  - ADLSE Table
  - ADLSE Field
  - ADLSE Table Last Timestamp
  - ADLSE Export Category
  - ADLSE Export Category Table
  - ADLSE Enum Translation
  - ADLSE Enum Translation Lang
  - Deleted Tables Not to Sync
  - ADLSE Deleted Record
- **Important**: After installation, you must manually configure the following fields in the ADLSE Setup:
  - **Tenant ID**: Azure tenant ID
  - **Client ID**: Azure app registration client ID
  - **Client Secret**: Azure app registration client secret
  
### Step 4: Verify Migration
- Verify that all your configuration has been migrated correctly
- Test the ADLSE functionality with the AppSource extension
- Ensure exports are working as expected

### Step 5: Uninstall Extensions
Once the migration is complete and verified:
1. Uninstall this migration extension (bc2adls_migration)
2. Uninstall the old BC2ADLS PTE extension

## Requirements

- Business Central version 27.0.0 or later
- Azure Data Lake Storage Export (ADLSE) AppSource extension version 27.46.0 or later
- BC2ADLS PTE extension version 27.44.0 or later

## Troubleshooting

If the migration does not complete:

1. **Check the Event Log**: Review Business Central event logs for any error messages
2. **Verify Versions**: Ensure all extensions are at the required minimum versions
3. **Contact Support**: If issues persist, contact the bc2adls team for assistance

## Notes

- This migration extension is designed to be temporary and should be uninstalled after successful migration
- The migration process is automatic and uses DataTransfer to ensure data integrity
- Upgrade tags are used to ensure migration operations run only once

## Resources

- **BC2ADLS PTE Extension (Legacy)**
  https://github.com/Bertverbeek4PS/bc2adls

- **BC2ADLS AppSource Extension**
  https://marketplace.microsoft.com/en-us/product/dynamics-365-business-central/PUBID.bc2adls01%7CAID.bc2adls%7CPAPPID.7a4530b3-2449-40ad-9779-97f4663ce51f?tab=Overview

## Support

For issues or questions regarding the migration, please contact The bc2adls team through official support channels.
