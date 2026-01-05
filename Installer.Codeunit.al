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
        bc2adls_ADLSERun();
    end;

    local procedure bc2adls_setup()
    var
        AZDSetup: Record "AZD Setup";
        ADLSESetup: Record "ADLSE Setup";
        bc2adls_dataTransfer: DataTransfer;
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsSetupTableUpgradeTag()) then
            exit;

        AZDSetup.DeleteAll();

        bc2adls_dataTransfer.SetTables(Database::"ADLSE Setup", Database::"AZD Setup");
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo("Primary Key"), AZDSetup.FieldNo("Primary Key"));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo("Account Name"), AZDSetup.FieldNo("Account Name"));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo(Container), AZDSetup.FieldNo(Container));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo(MaxPayloadSizeMiB), AZDSetup.FieldNo(MaxPayloadSizeMiB));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo(DataFormat), AZDSetup.FieldNo(DataFormat));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo("Emit telemetry"), AZDSetup.FieldNo("Emit telemetry"));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo("Skip Timestamp Sorting On Recs"), AZDSetup.FieldNo("Skip Timestamp Sorting On Recs"));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo("Storage Type"), AZDSetup.FieldNo("Storage Type"));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo(Workspace), AZDSetup.FieldNo(Workspace));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo(Lakehouse), AZDSetup.FieldNo(Lakehouse));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo(LandingZone), AZDSetup.FieldNo(LandingZone));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo("Schema Exported On"), AZDSetup.FieldNo("Schema Exported On"));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo("Translations"), AZDSetup.FieldNo("Translations"));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo("Export Enum as Integer"), AZDSetup.FieldNo("Export Enum as Integer"));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo("Delete Table"), AZDSetup.FieldNo("Delete Table"));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo("Maximum Retries"), AZDSetup.FieldNo("Maximum Retries"));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo("Delivered DateTime"), AZDSetup.FieldNo("Delivered DateTime"));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo("Export Company Database Tables"), AZDSetup.FieldNo("Export Company Database Tables"));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo("Delayed Export"), AZDSetup.FieldNo("Delayed Export"));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo("Use Field Captions"), AZDSetup.FieldNo("Use Field Captions"));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo("Use IDs for Duplicates Only"), AZDSetup.FieldNo("Use IDs for Duplicates Only"));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo("Use Table Captions"), AZDSetup.FieldNo("Use Table Captions"));
        bc2adls_dataTransfer.AddFieldValue(ADLSESetup.FieldNo("Export Closing Date column"), AZDSetup.FieldNo("Export Closing Date column"));
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsSetupTableUpgradeTag());
    end;

    local procedure bc2adls_table()
    var
        AZDTable: Record "AZD Table";
        ADLSETable: Record "ADLSE Table";
        bc2adls_dataTransfer: DataTransfer;
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsTableTableUpgradeTag()) then
            exit;

        AZDTable.DeleteAll();

        bc2adls_dataTransfer.SetTables(Database::"ADLSE Table", Database::"AZD Table");
        bc2adls_dataTransfer.AddFieldValue(ADLSETable.FieldNo("Table ID"), AZDTable.FieldNo("Table ID"));
        bc2adls_dataTransfer.AddFieldValue(ADLSETable.FieldNo(Enabled), AZDTable.FieldNo(Enabled));
        bc2adls_dataTransfer.AddFieldValue(ADLSETable.FieldNo("ExportCategory"), AZDTable.FieldNo("ExportCategory"));
        bc2adls_dataTransfer.AddFieldValue(ADLSETable.FieldNo("ExportFileNumber"), AZDTable.FieldNo("ExportFileNumber"));
        bc2adls_dataTransfer.AddFieldValue(ADLSETable.FieldNo("Initial Load Start Date"), AZDTable.FieldNo("Initial Load Start Date"));
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsTableTableUpgradeTag());
    end;

    local procedure bc2adls_field()
    var
        AZDField: Record "AZD Field";
        ADLSEField: Record "ADLSE Field";
        bc2adls_dataTransfer: DataTransfer;
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsFieldTableUpgradeTag()) then
            exit;

        AZDField.DeleteAll();

        bc2adls_dataTransfer.SetTables(Database::"ADLSE Field", Database::"AZD Field");
        bc2adls_dataTransfer.AddFieldValue(ADLSEField.FieldNo("Table ID"), AZDField.FieldNo("Table ID"));
        bc2adls_dataTransfer.AddFieldValue(ADLSEField.FieldNo("Field ID"), AZDField.FieldNo("Field ID"));
        bc2adls_dataTransfer.AddFieldValue(ADLSEField.FieldNo(Enabled), AZDField.FieldNo(Enabled));
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsFieldTableUpgradeTag());
    end;

    local procedure bc2adls_lastTimestamp()
    var
        AZDLastTimestamp: Record "AZD Table Last Timestamp";
        ADLSELastTimestamp: Record "ADLSE Table Last Timestamp";
        bc2adls_dataTransfer: DataTransfer;
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsLastTimestampTableUpgradeTag()) then
            exit;

        AZDLastTimestamp.DeleteAll();

        bc2adls_dataTransfer.SetTables(Database::"ADLSE Table Last Timestamp", Database::"AZD Table Last Timestamp");
        bc2adls_dataTransfer.AddFieldValue(ADLSELastTimestamp.FieldNo("Company Name"), AZDLastTimestamp.FieldNo("Company Name"));
        bc2adls_dataTransfer.AddFieldValue(ADLSELastTimestamp.FieldNo("Table ID"), AZDLastTimestamp.FieldNo("Table ID"));
        bc2adls_dataTransfer.AddFieldValue(ADLSELastTimestamp.FieldNo("Updated Last Timestamp"), AZDLastTimestamp.FieldNo("Updated Last Timestamp"));
        bc2adls_dataTransfer.AddFieldValue(ADLSELastTimestamp.FieldNo("Deleted Last Entry No."), AZDLastTimestamp.FieldNo("Deleted Last Entry No."));
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsLastTimestampTableUpgradeTag());
    end;

    local procedure bc2adls_exportCategoryTable()
    var
        AZDExportCategoryTable: Record "AZD Export Category Table";
        ADLSEExportCategoryTable: Record "ADLSE Export Category Table";
        bc2adls_dataTransfer: DataTransfer;
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsExportCategoryTableTableUpgradeTag()) then
            exit;

        AZDExportCategoryTable.DeleteAll();

        bc2adls_dataTransfer.SetTables(Database::"ADLSE Export Category Table", Database::"AZD Export Category Table");
        bc2adls_dataTransfer.AddFieldValue(ADLSEExportCategoryTable.FieldNo(Code), AZDExportCategoryTable.FieldNo(Code));
        bc2adls_dataTransfer.AddFieldValue(ADLSEExportCategoryTable.FieldNo(Description), AZDExportCategoryTable.FieldNo(Description));
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsExportCategoryTableTableUpgradeTag());
    end;

    local procedure bc2adls_enumTranslation()
    var
        AZDEnumTranslation: Record "AZD Enum Translation";
        ADLSEEnumTranslation: Record "ADLSE Enum Translation";
        bc2adls_dataTransfer: DataTransfer;
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsEnumTranslationTableUpgradeTag()) then
            exit;

        AZDEnumTranslation.DeleteAll();

        bc2adls_dataTransfer.SetTables(Database::"ADLSE Enum Translation", Database::"AZD Enum Translation");
        bc2adls_dataTransfer.AddFieldValue(ADLSEEnumTranslation.FieldNo("Table Id"), AZDEnumTranslation.FieldNo("Table Id"));
        bc2adls_dataTransfer.AddFieldValue(ADLSEEnumTranslation.FieldNo("Compliant Table Name"), AZDEnumTranslation.FieldNo("Compliant Table Name"));
        bc2adls_dataTransfer.AddFieldValue(ADLSEEnumTranslation.FieldNo("Field Id"), AZDEnumTranslation.FieldNo("Field Id"));
        bc2adls_dataTransfer.AddFieldValue(ADLSEEnumTranslation.FieldNo("Compliant Field Name"), AZDEnumTranslation.FieldNo("Compliant Field Name"));
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsEnumTranslationTableUpgradeTag());
    end;

    local procedure bc2adls_enumTranslationLang()
    var
        AZDEnumTranslationLang: Record "AZD Enum Translation Lang";
        ADLSEEnumTranslationLang: Record "ADLSE Enum Translation Lang";
        bc2adls_dataTransfer: DataTransfer;
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsEnumTranslationLangTableUpgradeTag()) then
            exit;

        AZDEnumTranslationLang.DeleteAll();

        bc2adls_dataTransfer.SetTables(Database::"ADLSE Enum Translation Lang", Database::"AZD Enum Translation Lang");
        bc2adls_dataTransfer.AddFieldValue(ADLSEEnumTranslationLang.FieldNo("Language Code"), AZDEnumTranslationLang.FieldNo("Language Code"));
        bc2adls_dataTransfer.AddFieldValue(ADLSEEnumTranslationLang.FieldNo("Table Id"), AZDEnumTranslationLang.FieldNo("Table Id"));
        bc2adls_dataTransfer.AddFieldValue(ADLSEEnumTranslationLang.FieldNo("Compliant Table Name"), AZDEnumTranslationLang.FieldNo("Compliant Table Name"));
        bc2adls_dataTransfer.AddFieldValue(ADLSEEnumTranslationLang.FieldNo("Field Id"), AZDEnumTranslationLang.FieldNo("Field Id"));
        bc2adls_dataTransfer.AddFieldValue(ADLSEEnumTranslationLang.FieldNo("Compliant Field Name"), AZDEnumTranslationLang.FieldNo("Compliant Field Name"));
        bc2adls_dataTransfer.AddFieldValue(ADLSEEnumTranslationLang.FieldNo("Enum Value Id"), AZDEnumTranslationLang.FieldNo("Enum Value Id"));
        bc2adls_dataTransfer.AddFieldValue(ADLSEEnumTranslationLang.FieldNo("Enum Value Caption"), AZDEnumTranslationLang.FieldNo("Enum Value Caption"));
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsEnumTranslationLangTableUpgradeTag());
    end;

    local procedure bc2adls_deletedTablesNotToSync()
    var
        AZDDeletedTableFilter: Record "AZD Deleted Table Filter";
        DeletedTablesNotToSync: Record "Deleted Tables Not to Sync";
        bc2adls_dataTransfer: DataTransfer;
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsDeletedTablesNotToSyncTableUpgradeTag()) then
            exit;

        AZDDeletedTableFilter.DeleteAll();

        bc2adls_dataTransfer.SetTables(Database::"Deleted Tables Not to Sync", Database::"AZD Deleted Table Filter");
        bc2adls_dataTransfer.AddFieldValue(DeletedTablesNotToSync.FieldNo(TableId), AZDDeletedTableFilter.FieldNo(TableId));
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsDeletedTablesNotToSyncTableUpgradeTag());
    end;

    local procedure bc2adls_deletedRecord()
    var
        AZDDeletedRecord: Record "AZD Deleted Record";
        ADLSEDeletedRecord: Record "ADLSE Deleted Record";
        bc2adls_dataTransfer: DataTransfer;
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsDeletedRecordTableUpgradeTag()) then
            exit;

        AZDDeletedRecord.DeleteAll();

        bc2adls_dataTransfer.SetTables(Database::"ADLSE Deleted Record", Database::"AZD Deleted Record");
        bc2adls_dataTransfer.AddFieldValue(ADLSEDeletedRecord.FieldNo("Entry No."), AZDDeletedRecord.FieldNo("Entry No."));
        bc2adls_dataTransfer.AddFieldValue(ADLSEDeletedRecord.FieldNo("Table ID"), AZDDeletedRecord.FieldNo("Table ID"));
        bc2adls_dataTransfer.AddFieldValue(ADLSEDeletedRecord.FieldNo("System ID"), AZDDeletedRecord.FieldNo("System ID"));
        bc2adls_dataTransfer.AddFieldValue(ADLSEDeletedRecord.FieldNo("Deletion Timestamp"), AZDDeletedRecord.FieldNo("Deletion Timestamp"));
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsDeletedRecordTableUpgradeTag());
    end;

    local procedure bc2adls_ADLSERun()
    var
        AZDRun: Record "AZD Run";
        ADLSERun: Record "ADLSE Run";
        bc2adls_dataTransfer: DataTransfer;
    begin
        if UpgradeTag.HasUpgradeTag(CopyBc2adlsADLSERunTableUpgradeTag()) then
            exit;

        AZDRun.DeleteAll();

        bc2adls_dataTransfer.SetTables(Database::"ADLSE Run", Database::"AZD Run");
        bc2adls_dataTransfer.AddFieldValue(ADLSERun.FieldNo("ID"), AZDRun.FieldNo("ID"));
        bc2adls_dataTransfer.AddFieldValue(ADLSERun.FieldNo("Table ID"), AZDRun.FieldNo("Table ID"));
        bc2adls_dataTransfer.AddFieldValue(ADLSERun.FieldNo("Company Name"), AZDRun.FieldNo("Company Name"));
        bc2adls_dataTransfer.AddFieldValue(ADLSERun.FieldNo(State), AZDRun.FieldNo(State));
        bc2adls_dataTransfer.AddFieldValue(ADLSERun.FieldNo("Error"), AZDRun.FieldNo("Error"));
        bc2adls_dataTransfer.AddFieldValue(ADLSERun.FieldNo(Started), AZDRun.FieldNo(Started));
        bc2adls_dataTransfer.AddFieldValue(ADLSERun.FieldNo(Ended), AZDRun.FieldNo(Ended));
        bc2adls_dataTransfer.CopyRows();

        UpgradeTag.SetUpgradeTag(CopyBc2adlsADLSERunTableUpgradeTag());
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

    local procedure CopyBc2adlsADLSERunTableUpgradeTag(): Code[250]
    begin
        exit('GITHUB-1-CopyBc2adlsADLSERunTableUpgrade-20260101');
    end;

    var
        UpgradeTag: Codeunit "Upgrade Tag";
}