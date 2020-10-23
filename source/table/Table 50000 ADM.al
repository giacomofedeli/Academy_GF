table 50000 "ADM Nutritional Info"
{
    DataClassification = ToBeClassified;
    Caption = 'Nutritional informations';

    fields
    {
        field(1; "item No."; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'item No.';
            TableRelation = item."No.";


        }
        field(20; "Item description"; text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'item description';
            trigger OnValidate()
            var
                item: Record Item;
            begin
                item.Get(Rec."Item No.");
                Rec."Item description" := item.Description;
                // rec.Modify();
            end;


        }

        field(30; "Item Description 2"; Text[50])
        {
            //DataClassification = ToBeClassified;
            Caption = 'item Description 2';
            Fieldclass = FlowField;
            CalcFormula = lookup(Item."Description 2" where("No." = field("Item No.")));
            Editable = false;
        }

        field(40; "Nutritional type"; Enum "ADM Nutritional Info Type")
        {
            DataClassification = ToBeClassified;

        }
        field(50; "Amount"; Decimal)
        {
            Caption = 'Amount';

        }
    }



    keys
    {
        key(PK; "Item No.", "Nutritional Type")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        Total: Decimal;
        ADM: Record "ADM Nutritional Info";
    begin
        ADM.SetRange("Item No.", Rec."item No.");
        Total := 0;
        if ADM.CalcSums(Amount) then
            Total := Rec.Amount + ADM.Amount;
        if Total >= 2000 then
            Error('The sum of the calories is above 2000');

    end;

    trigger OnModify()
    var
        Total: Decimal;
        ADM: Record "ADM Nutritional Info";
    begin
        ADM.SetRange("Item No.", Rec."item No.");
        Total := 0;
        if ADM.CalcSums(Amount) then
            Total := Rec.Amount + ADM.Amount;
        if Total >= 2000 then
            Error('The sum of the calories is above 2000');

    end;

}