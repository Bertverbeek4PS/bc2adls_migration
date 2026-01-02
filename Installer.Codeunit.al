codeunit 83500 "BC2ADLS Installer"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        bc2adls_enumTranslation();
        bc2adls_enumTranslationLang();
        bc2adls_deletedTablesNotToSync();
        bc2adls_deletedRecord();
    end;

    trigger OnInstallAppPerDatabase()
    begin
        bc2adls_setup();
        bc2adls_table();
        bc2adls_field();
        bc2adls_lastTimestamp();
        bc2adls_exportCategoryTable();
    end;

    local procedure bc2adls_setup()
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsSetupTableUpgradeTag()) then
            exit;

        bc2adls_dataTransfer.SetTables(Database::"ADLSE Setup", Database::"AZD Setup");
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsSetupTableUpgradeTag());
    end;

    local procedure bc2adls_table()
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsTableTableUpgradeTag()) then
            exit;

        bc2adls_dataTransfer.SetTables(Database::"ADLSE Table", Database::"AZD Table");
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsTableTableUpgradeTag());
    end;

    local procedure bc2adls_field()
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsFieldTableUpgradeTag()) then
            exit;

        bc2adls_dataTransfer.SetTables(Database::"ADLSE Field", Database::"AZD Field");
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsFieldTableUpgradeTag());
    end;

    local procedure bc2adls_lastTimestamp()
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsLastTimestampTableUpgradeTag()) then
            exit;

        bc2adls_dataTransfer.SetTables(Database::"ADLSE Table Last Timestamp", Database::"ADLSE Table Last Timestamp");
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsLastTimestampTableUpgradeTag());
    end;

    local procedure bc2adls_exportCategoryTable()
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsExportCategoryTableTableUpgradeTag()) then
            exit;

        bc2adls_dataTransfer.SetTables(Database::"ADLSE Export Category Table", Database::"ADLSE Export Category Table");
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsExportCategoryTableTableUpgradeTag());
    end;

    local procedure bc2adls_enumTranslation()
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsEnumTranslationTableUpgradeTag()) then
            exit;

        bc2adls_dataTransfer.SetTables(Database::"ADLSE Enum Translation", Database::"ADLSE Enum Translation");
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsEnumTranslationTableUpgradeTag());
    end;

    local procedure bc2adls_enumTranslationLang()
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsEnumTranslationLangTableUpgradeTag()) then
            exit;

        bc2adls_dataTransfer.SetTables(Database::"ADLSE Enum Translation Lang", Database::"ADLSE Enum Translation Lang");
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsEnumTranslationLangTableUpgradeTag());
    end;

    local procedure bc2adls_deletedTablesNotToSync()
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsDeletedTablesNotToSyncTableUpgradeTag()) then
            exit;

        bc2adls_dataTransfer.SetTables(Database::"Deleted Tables Not to Sync", Database::"Deleted Tables Not to Sync");
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsDeletedTablesNotToSyncTableUpgradeTag());
    end;

    local procedure bc2adls_deletedRecord()
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsDeletedRecordTableUpgradeTag()) then
            exit;

        bc2adls_dataTransfer.SetTables(Database::"ADLSE Deleted Record", Database::"ADLSE Deleted Record");
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsDeletedRecordTableUpgradeTag());
    end;

    local procedure CopyBc2adlsSetupTableUpgradeTag(): Code[250]
    begin
        exit('GITHUB-1-CopyBc2adlsSetupTableUpgrade-20260101');
    end;

    local procedure CopyBc2adlsTableTableUpgradeTag(): Code[250]
    begin
        exit('GITHUB-1-CopyBc2adlsTableTableUpgrade-20260101');
    end;

    local procedure CopyBc2adlsFieldTableUpgradeTag(): Code[250]
    begin
        exit('GITHUB-1-CopyBc2adlsFieldTableUpgrade-20260101');
    end;

    local procedure CopyBc2adlsLastTimestampTableUpgradeTag(): Code[250]
    begin
        exit('GITHUB-1-CopyBc2adlsLastTimestampTableUpgrade-20260101');
    end;

    local procedure CopyBc2adlsExportCategoryTableTableUpgradeTag(): Code[250]
    begin
        exit('GITHUB-1-CopyBc2adlsExportCategoryTableTableUpgrade-20260101');
    end;

    local procedure CopyBc2adlsEnumTranslationTableUpgradeTag(): Code[250]
    begin
        exit('GITHUB-1-CopyBc2adlsEnumTranslationTableUpgrade-20260101');
    end;

    local procedure CopyBc2adlsEnumTranslationLangTableUpgradeTag(): Code[250]
    begin
        exit('GITHUB-1-CopyBc2adlsEnumTranslationLangTableUpgrade-20260101');
    end;

    local procedure CopyBc2adlsDeletedTablesNotToSyncTableUpgradeTag(): Code[250]
    begin
        exit('GITHUB-1-CopyBc2adlsDeletedTablesNotToSyncTableUpgrade-20260101');
    end;

    local procedure CopyBc2adlsDeletedRecordTableUpgradeTag(): Code[250]
    begin
        exit('GITHUB-1-CopyBc2adlsDeletedRecordTableUpgrade-20260101');
    end;

    var
        UpgradeTag: Codeunit "Upgrade Tag";
        bc2adls_dataTransfer: DataTransfer;
}