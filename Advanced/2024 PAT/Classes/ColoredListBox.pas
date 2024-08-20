unit ColoredListBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids,
  Menus, dmPropertyHub_U, PopupPanel, CustomButtons, ADODB, AgentPropertyCard,
  Spin, Client, IOUtils;

type
  TColoredListBox = class helper for TListBox
  private
    function GetItemColors: TStringList;
    procedure SetItemColors(const Value: TStringList);
    procedure EnsureColoredSetup;
  public
    procedure SetItemColor(Index: Integer; Color: TColor);
    function GetItemColor(Index: Integer): TColor;
    procedure ColoredDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
              State: TOwnerDrawState);
    property ItemColors: TStringList read GetItemColors write SetItemColors;
  end;

implementation

uses
  Types;

const
  ColorPrefix = 'Color:';

{ TColoredListBox }

procedure TColoredListBox.ColoredDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  ColorStr: string;
  ItemColor: TColor;
  ListBox: TListBox;
begin
  ListBox := TListBox(Control);
  with ListBox.Canvas do
  begin
    FillRect(Rect);
    ColorStr := GetItemColors.Values[ListBox.Items[Index]];
    if ColorStr <> '' then
      ItemColor := StringToColor(Copy(ColorStr, Length(ColorPrefix) + 1, Length(ColorStr)))
    else
      ItemColor := Font.Color;

    Font.Color := ItemColor;
    TextOut(Rect.Left + 2, Rect.Top, ListBox.Items[Index]);

    if odSelected in State then
    begin
      Brush.Color := clHighlight;
      Font.Color := clHighlightText;
      Windows.DrawFocusRect(Handle, Rect);
    end;
  end;

end;

procedure TColoredListBox.EnsureColoredSetup;
begin
  if Style <> lbOwnerDrawFixed then
    Style := lbOwnerDrawFixed;

  if not Assigned(OnDrawItem) then
    OnDrawItem := ColoredDrawItem;

  if not Assigned(TObject(Items.Objects[0])) or not (TObject(Items.Objects[0]) is TStringList) then
  begin
    if Assigned(TObject(Items.Objects[0])) then
      TObject(Items.Objects[0]).Free;
    Items.Objects[0] := TStringList.Create;
  end;
end;

function TColoredListBox.GetItemColor(Index: Integer): TColor;
var
  ColorStr: string;
begin
  EnsureColoredSetup;
  if (index >= 0) and (Index < Items.Count) then
  begin
    ColorStr := GetItemColors.Values[Items[Index]];
    if ColorStr <> '' then
      Result := StringToColor(Copy(ColorStr, Length(ColorPrefix) + 1, Length(ColorStr)))
    else
      Result := Font.Color;

  end else
    Result := Font.Color;
end;

function TColoredListBox.GetItemColors: TStringList;
begin
  EnsureColoredSetup;
  Result := TStringList(Items.Objects[0]);
end;

procedure TColoredListBox.SetItemColor(Index: Integer; Color: TColor);
begin
  EnsureColoredSetup;
  if (Index >= 0) and (Index < Items.Count) then
  begin
    GetItemColors.Values[Items[Index]] := ColorPrefix + ColorToString(Color);
  end;
end;

procedure TColoredListBox.SetItemColors(const Value: TStringList);
begin
  EnsureColoredSetup;
  GetItemColors.Assign(Value);
  Invalidate;
end;

end.
