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
                }
                field(Amount; Amount)
                {
                    ApplicationArea = All;
                    // FieldPropertyName = FieldPropertyValue;
                }

            }
        }

    }

}