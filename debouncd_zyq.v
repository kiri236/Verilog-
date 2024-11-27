module debounce(
    input wire clk,          // 时钟信号
    input wire reset,        // 复位信号
    input wire [3:0]button_in,    // 原始按键输入
    output reg [3:0]button_out    // 消抖后的按键输出
);

    reg [15:0] counter;      // 计数器，用于消抖时间
    reg button_sync_0;       // 同步化输入
    reg button_sync_1;       // 同步化输入

    // 同步化输入，防止亚稳态
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            button_sync_0 <= 0;
            button_sync_1 <= 0;
        end else begin
            button_sync_0 <= button_in;
            button_sync_1 <= button_sync_0;
        end
    end

    // 消抖逻辑
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            button_out <= 0;
        end else if (button_sync_1 == button_out) begin
            counter <= 0; // 未检测到变化，重置计数器
        end else begin
            counter <= counter + 1;
            if (counter == 16'hFFFF) begin
                button_out <= button_sync_1; // 计数器溢出，更新输出
            end
        end
    end

endmodule
