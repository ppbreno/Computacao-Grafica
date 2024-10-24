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
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
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
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
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
  op := 1;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  op := 2;
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
  if op = 8 then begin
                      X1 := X;
                      Y1 := Y;
                      Image1.Canvas.MoveTo(X,Y);
  end;
  if op = 9 then begin
                      X1 := X;
                      Y1 := Y;
                      Image1.Canvas.MoveTo(X,Y);
  end;
  if op = 10 then begin
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
var dx, dy, xi, yi, incx, incy, x2, y2, err, e2, dE, dSE, h, i: Integer;
    cos1, sen1, xn, yn, xaux : Double;
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

       dx := Abs(x2 - x1);
       dy := Abs(y2 - y1);

       if x1 < x2 then incx := 1 else incx := -1;
       if y1 < y2 then incy := 1 else incy := -1;

       err := dx - dy;

       while True do
       begin

            Image1.Canvas.Pixels[x1, y1] := clRed;

            if (x1 = x2) and (y1 = y2) then Break;

            e2 := 2 * err;

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
           Image1.Canvas.Pixels[xi+x1, yi+y1] := clRed;
           Image1.Canvas.Pixels[xi+x1, -yi+y1] := clRed;
       end;
  end;
  if op = 8 then begin
       x2 := X;
       y2 := Y;
       raio := trunc(sqrt((X1-x2)*(X1-x2)+(Y1-y2)*(Y1-y2)));
       t := 0;
       while (t <= 1.57) do
       begin
         xi := trunc(raio * Cos(t));
         yi := trunc(raio * Sin(t));

        Image1.Canvas.Pixels[xi + X1, yi + Y1] := clRed;  // 1º octante
        Image1.Canvas.Pixels[-xi + X1, yi + Y1] := clRed; // 2º octante
        Image1.Canvas.Pixels[xi + X1, -yi + Y1] := clRed; // 3º octante
        Image1.Canvas.Pixels[-xi + X1, -yi + Y1] := clRed; // 4º octante
        Image1.Canvas.Pixels[yi + X1, xi + Y1] := clRed;  // 5º octante
        Image1.Canvas.Pixels[-yi + X1, xi + Y1] := clRed; // 6º octante
        Image1.Canvas.Pixels[yi + X1, -xi + Y1] := clRed; // 7º octante
        Image1.Canvas.Pixels[-yi + X1, -xi + Y1] := clRed; // 8º octante

        t := t + 0.01;
       end;
  end;
  if op = 9 then begin
       x2 := X;
       y2 := Y;
       xn := sqrt((X1-x2)*(X1-x2)+(Y1-y2)*(Y1-y2));
       yn := 0;

       cos1 := Cos(Pi/180);
       sen1 := Sin(Pi/180);

       for i := 1 to 360 do
           begin
           Image1.Canvas.Pixels[round(x1 + xn), round(y1 + yn)] := clRed;

           xaux := xn * cos1 - yn * sen1;
           yn := xn * sen1 + yn * cos1;
           xn := xaux;
           end;
  end;
  if op = 10 then begin
       x2 := X;
       y2 := Y;
       raio := trunc(sqrt((X1-x2)*(X1-X2)+(y1-y2)*(y1-y2)));
       xi := 0;
       yi := raio;
       h := 1 - raio;
       dE := 3;
       dSE := -2 * raio + 5;

        Image1.Canvas.Pixels[x1 + xi, y1 + yi] := clRed;

        while xi < yi do
        begin
          if h < 0 then
          begin
            h := h + dE;
            dE := dE + 2;
            dSE := dSE + 2;
          end
          else
          begin
            h := h + dSE;
            dE := dE + 2;
            dSE := dSE + 4;
            yi := yi - 1;
          end;

          xi := xi + 1;

          Image1.Canvas.Pixels[x1 + xi, y1 + yi] := clRed;  // 1º octante
          Image1.Canvas.Pixels[x1 - xi, y1 + yi] := clRed;  // 2º octante
          Image1.Canvas.Pixels[x1 + xi, y1 - yi] := clRed;  // 3º octante
          Image1.Canvas.Pixels[x1 - xi, y1 - yi] := clRed;  // 4º octante
          Image1.Canvas.Pixels[x1 + yi, y1 + xi] := clRed;  // 5º octante
          Image1.Canvas.Pixels[x1 - yi, y1 + xi] := clRed;  // 6º octante
          Image1.Canvas.Pixels[x1 + yi, y1 - xi] := clRed;  // 7º octante
          Image1.Canvas.Pixels[x1 - yi, y1 - xi] := clRed;  // 8º octante
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

procedure TForm1.MenuItem14Click(Sender: TObject);
begin
     op := 8;
end;

procedure TForm1.MenuItem15Click(Sender: TObject);
begin
     op := 9;
end;

procedure TForm1.MenuItem16Click(Sender: TObject);
begin
     op := 10;
end;

procedure TForm1.MenuItem17Click(Sender: TObject);
begin
end;

end.

