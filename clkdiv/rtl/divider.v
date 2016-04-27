`timescale 1ns/10ps
 
module divider(
  input  i_clk,
  input  i_rst_n,
   
  output o_clk
);
  
parameter U_DLY = 1;
 
// log2(5) = 2.3219 <= 3  
reg [2:0] cnt_p;                        // �����ؼ�����
  
// 5λ�����ؼ�����: 0 ~ 4
// 4 = 5 - 1
always @ (posedge i_clk, negedge i_rst_n)
begin
  if (!i_rst_n)
    cnt_p <= 0;
  else
    begin
    if (cnt_p == 4)
      cnt_p <= 0;
    else
      cnt_p <= #U_DLY cnt_p + 1'b1;
    end
end
 
// log2(5) = 2.3219 <= 3  
reg [2:0] cnt_n;                        // �½��ؼ�����
 
// 5λ�½��ؼ�����: 0 ~ 4
// 4 = 5 - 1
always @ (negedge i_clk, negedge i_rst_n)
begin
  if (!i_rst_n)
    cnt_n <= 0;
  else
  begin
    if (cnt_n == 4)
      cnt_n <= 0;
    else
      cnt_n <= #U_DLY cnt_n + 1'b1;
  end
end
  
 
reg o_clk_p;                            // ������ʱ������Ĵ���
 
// ���������ʱ��
// 0     ~ 2 ��-> 1
// (2+1) ~ 4 ��-> 0
// 2 = 5>>1
// 4 = 5 - 1
always @ (posedge i_clk, negedge i_rst_n)
begin
  if (!i_rst_n)
    o_clk_p <= 0;
  else
  begin
    if (cnt_p <= 2)                     // 2 = 5>>1
      o_clk_p <= 1;
    else
      o_clk_p <= 0;
  end
end
  
reg o_clk_n;                            // �½���ʱ������Ĵ���
 
// ����½���ʱ��
// 0     ~ 2 ��-> 1
// (2+1) ~ 4 ��-> 0
// 2 = 5>>1
// 4 = 5 - 1
always @ (negedge i_clk, negedge i_rst_n)
begin
  if (!i_rst_n)
    o_clk_n <= 0;
  else
  begin
    if (cnt_n <= 2)                     // 2 = 5>>1
      o_clk_n <= 1;
    else
      o_clk_n <= 0;
  end
end
 
assign o_clk = o_clk_n & o_clk_p;       // ��λ��(����:����)
  
endmodule