page 50001 "ADM Nutr. Info Factbox"
{
    Caption = 'Nutritional Info Factbox';
    PageType = ListPart;
    SourceTable = "ADM Nutritional Info";
    //SourceTableView = 

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Nutritional Type"; "Nutritional Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nutritional Information Type field';
                }
                field(Amount; Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field';
                    // FieldPropertyName = FieldPropertyValue;
                }

            }
        }

    }

}