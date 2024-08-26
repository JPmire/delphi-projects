unit PopupPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Math, pngimage, jpeg, Generics.Collections;

type
  TPopupPanel = class
  private
    FContainerPanel: TPanel;
    FItems: TList<TPanel>;
    FPopupX, FPopupY: Integer;
    NewPanel: TPanel;
    fItemCount : integer;
  public
    constructor Create(ContainerPanel: TPanel);
    destructor Destroy; override;
    procedure Add(const Caption: string);
    function GetPanel(Index: Integer): TPanel;
    procedure Delete(Index: Integer);
    procedure Popup(X, Y: Integer);
    procedure Close;
    function Count : Integer;
    property Buttons : TList<TPanel> read fItems;
  end;

implementation

function TPopupPanel.Count: Integer;
begin
  result := fItemCount;
end;

procedure TPopupPanel.Close;
begin
  FContainerPanel.Visible := False;
end;

constructor TPopupPanel.Create(ContainerPanel: TPanel);
begin
  inherited Create;
  FContainerPanel := ContainerPanel;
  FItems := TList<TPanel>.Create;
  fItemCount := 0;
end;

destructor TPopupPanel.Destroy;
begin
  FItems.Free;
  inherited;
end;

procedure TPopupPanel.Add(const Caption: string);
begin
  NewPanel := TPanel.Create(FContainerPanel);
  with NewPanel do
  begin
    Parent := FContainerPanel;
    Align := alTop;
    Height := 30;
    ParentBackground := False;
    Color := FContainerPanel.Color;
    //BevelInner := bvNone;
    //BevelOuter := bvNone;
    //BevelKind := bkFlat;
  end;
  NewPanel.Caption := Caption;
  FItems.Insert(fItemCount, NewPanel); // Add to the beginning of the list
  inc(fItemCount);
  // Adjust container panel height
  FContainerPanel.Height := FItems.Count * NewPanel.Height;
end;

function TPopupPanel.GetPanel(Index: Integer): TPanel;
begin
  if (Index >= 0) and (Index < FItems.Count) then
    Result := FItems[Index]
  else
    Result := nil;
end;

procedure TPopupPanel.Delete(Index: Integer);
var
  i: Integer;
begin
  if (Index >= 0) and (Index < FItems.Count) then
  begin
    FItems[Index].Free;
    FItems.Delete(Index);
    Dec(fItemCount);
    // Restack the panels
    for i := 0 to FItems.Count - 1 do
      FItems[i].Top := i * FItems[0].Height;
      FContainerPanel.Height := FItems.Count * NewPanel.Height;
  end;

end;

procedure TPopupPanel.Popup(X, Y: Integer);
begin
  FPopupX := X;
  FPopupY := Y;
  FContainerPanel.Left := X;
  FContainerPanel.Top := Y;
  FContainerPanel.Visible := True;
end;

end.
