pageextension 50000 "ADM PageExt50000" extends "Item Card"
{
    layout
    {
        addlast(content)
        {
            group(NutritionalInfos)
            {
                Caption = 'Nutritional Infos';
                field("total calories"; "total calories")
                {
                    ApplicationArea = All;
                    Caption = 'totalcalories';

                    trigger OnAssistEdit()
                    var
                        ADMNutritionalInfo: Record "ADM Nutritional Info";
                        Quantity: Decimal;
                    begin

                        if Confirm('Do You want to calculate the total calories for item %1 ?', false, Rec."No.") then begin
                            Quantity := 0.0;
                            ADMNutritionalInfo.SetRange("Item No.", Rec."No.");
                            if ADMNutritionalInfo.FindSet() then
                                repeat
                                    Quantity += ADMNutritionalInfo.Amount;
                                until ADMNutritionalInfo.Next() = 0;
                            Quantity := Quantity * (Rec."Net Weight" / 100);

                            Rec."total calories" := Quantity;
                            Rec.Modify();
                        end;


                    end;

                }

            }
        }



        addfirst(factboxes)
        {
            part("ADM Nutr. Info Factbox"; "ADM Nutr. Info Factbox")
            {
                Caption = 'Nutritional Infos';
                ApplicationArea = all;
                SubPageLink = "Item No." = field("No.");
            }

        }

    }

    actions
    {

        addlast(navigation)
        {
            group(NutritionalInfo)
            {
                Caption = 'Item Nutritional Infos';
                action(Nutritional)
                {
                    ApplicationArea = All;
                    Caption = 'Show Nutritional Infos';
                    Image = RelatedInformation;
                    trigger OnAction()
                    var
                        ADMNutritionalInfo: Record "ADM Nutritional Info";
                        ADMNutritionalInfoPage: Page "ADM Nutritional Info";
                        TotCal: Decimal;
                        locitem: Record item;

                    begin
                        ADMNutritionalInfo.setRange("Item No.", "No.");
                        ADMNutritionalInfoPage.SetTableView(ADMNutritionalInfo);
                        ADMNutritionalInfoPage.RunModal();

                        TotCal := 0;
                        ADMNutritionalInfo.Reset();
                        ADMNutritionalInfo.SetRange("Item No.", "No.");
                        if ADMNutritionalInfo.FindSet() then
                            repeat
                                TotCal += ADMNutritionalInfo.Amount;
                            until ADMNutritionalInfo.Next() = 0;

                        locitem.Get("No.");
                        locitem."total calories" := TotCal;
                        locitem.Modify();


                    end;




                }

            }

        }
    }


}