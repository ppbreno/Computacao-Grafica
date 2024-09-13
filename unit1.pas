unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls, Windows;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Separator1: TMenuItem;
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2Click(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  op, desenha, X1, Y1, raio, inc : integer;
  m, t : Double;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  if (opendialog1.execute())
   then
   Image1.Picture.loadfromfile(OpenDialog1.filename);
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem4Click(Sender: TObject);
var cor:TColor;
i,j,r,g,b,cinza : integer;
begin
  for i:=0 to Image1.Width do
    for j:=0 to Image1.Height do
      begin
        cor := Image1.Canvas.Pixels[i,j];
        r := getrvalue(cor);
        g := getgvalue(cor);
        b := getbvalue(cor);
        cinza := (r+g+b) div 3;
        Image2.Canvas.Pixels[i,j] := RGB(cinza,cinza,cinza);
      end;

end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  op := 1;    // desenha pixel
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  op := 2;    // desenha retas
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  op := 3;
end;

procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  Close();
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if op = 1 then desenha := 1;
  if op = 2 then begin
                      Image1.Canvas.MoveTo(X,Y);
                 end;
  if op = 3 then begin
                      X1 := X;
                      Y1 := Y;
                  end;
  if op = 4 then begin
                      X1 := X;
                      Y1 := Y;
                      Image1.Canvas.MoveTo(X,Y);
                 end;
  if op = 5 then begin
                      X1 := X;
                      Y1 := Y;
                      Image1.Canvas.MoveTo(X,Y);
                 end;
  if op = 6 then begin
                      X1 := X;
                      Y1 := Y;
                      Image1.Canvas.MoveTo(X,Y);
                 end;
  if op = 7 then begin
                      X1 := X;
                      Y1 := Y;
                      Image1.Canvas.MoveTo(X,Y);
  end;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if op = 1 then begin
    if (desenha = 1)
   then
   begin
     Image1.Canvas.Pixels[X,Y] := clRed;
     Image1.Canvas.Pixels[X+1,Y] := clRed;
     Image1.Canvas.Pixels[X,Y+1] := clRed;
     Image1.Canvas.Pixels[X+1,Y+1] := clRed;
   end;

  end;

end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var dx, dy, xi, yi, incx, incy, x2, y2, err, e2: Integer;
begin

  if op = 1 then desenha := 0;
  if op = 2 then begin
                 image1.Canvas.Pen.Color := clred;
                 Image1.Canvas.LineTo(X,Y);
                 end;
  if op = 3 then begin
                 x2 := X;
                 y2 := Y;
                 raio := trunc(sqrt((X1-x2)*(X1-X2)+(y1-y2)*(y1-y2)));
                 Image1.Canvas.Ellipse(X1-raio,y1-raio,x1+raio,y1+raio);
                 end;
  if op = 4 then begin
                 x2 := X;
                 y2 := Y;
                 if (x1 = x2) then
                    begin
                         if (y1 < y2) then
                            begin
                                 for yi:=y1 to y2 do
                                     Image1.Canvas.Pixels[x1,yi] := clRed;
                            end
                         else
                             begin
                                 for yi:=y2 to y1 do
                                     Image1.Canvas.Pixels[x1,yi] := clRed;
                             end;
                    end
                 else begin
                   if (ABS(x2-x1)>ABS(y2-y1)) then
                             begin
                                  if (x1 < x2) then
                                     inc := 1
                                  else
                                      inc := -1;
                                  xi:=x1;
                                  yi:=y1;
                                  m := (y2-y1) / (x2-x1);
                                  while (xi <> x2) do
                                        begin
                                             yi := Trunc(m*(xi-x1)+y1);
                                             Image1.Canvas.Pixels[xi,yi] := clRed;
                                             xi := xi+inc;
                                        end;
                              end
                   else
                       begin
                            if (y1 < y2) then
                                     inc := 1
                                  else
                                      inc := -1;
                                  xi:=x1;
                                  yi:=y1;
                                  m := (y2-y1) / (x2-x1);
                                  while (yi <> y2) do
                                        begin
                                             xi := Trunc((yi-y1)/m + x1);
                                             Image1.Canvas.Pixels[xi,yi] := clRed;
                                             yi := yi+inc;
                                        end;
                       end;
                   end;
                   end;
  if op = 5 then begin
                 t:=0;
                 x2 := X;
                 y2 := Y;
                 while (t<=1) do
                   begin
                        xi := Trunc(x1 + (x2-x1) * t);
                        yi := Trunc(y1 + (y2-y1) * t);
                        Image1.Canvas.Pixels[xi,yi] := clRed;
                        t := t+0.001;
                   end;
                 end;
  if op = 6 then begin
       x2 := X;
       y2 := Y;
       // Calcula as diferenças nas coordenadas
       dx := Abs(x2 - x1);
       dy := Abs(y2 - y1);

       // Determina a direção de incremento
       if x1 < x2 then incx := 1 else incx := -1;
       if y1 < y2 then incy := 1 else incy := -1;

       // Inicializa o erro
       err := dx - dy;

       while True do
       begin
            // Desenha o pixel atual
            Image1.Canvas.Pixels[x1, y1] := clRed;

            // Se o ponto final for atingido, interrompe o loop
            if (x1 = x2) and (y1 = y2) then Break;

            // Calcula o erro para o próximo ponto
            e2 := 2 * err;

            // Ajusta o erro e as coordenadas
            if e2 > -dy then
            begin
                 err := err - dy;
                 x1 := x1 + incx;
            end;

            if e2 < dx then
            begin
                 err := err + dx;
                 y1 := y1 + incy;
            end;
       end;
  end;
  if op = 7 then begin
       x2 := X;
       y2 := Y;
       raio := trunc(sqrt((X1-x2)*(X1-X2)+(y1-y2)*(y1-y2)));
       for xi := -raio to raio do begin
           yi := trunc(sqrt((raio*raio) - (xi*xi)));
           Image1.Canvas.Pixels[xi, yi] := clRed;
           Image1.Canvas.Pixels[xi, -yi] := clRed;
       end;
  end;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin
     op := 4;
end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin
     op := 5;
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
     op := 6;
end;

procedure TForm1.MenuItem13Click(Sender: TObject);
begin
     op := 7;
end;

end.

