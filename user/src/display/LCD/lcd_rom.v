module lcd_rom (
        input         pclk,
        input         rst_n,

        input  [9:0]  addr,

        output [23:0] pixel_data
    );

    reg  [23:0] r_pixel_data;

    assign pixel_data = r_pixel_data;

    always @(posedge pclk) begin
        if(rst_n == 1'b0) begin
            r_pixel_data <= 24'h000000;
        end
        else begin
            case(addr)
                10'd0:
                    r_pixel_data <= 24'he5e6fa;
                10'd1:
                    r_pixel_data <= 24'he3e9f9;
                10'd2:
                    r_pixel_data <= 24'he1edf9;
                10'd3:
                    r_pixel_data <= 24'hddf0f6;
                10'd4:
                    r_pixel_data <= 24'hddf2f5;
                10'd5:
                    r_pixel_data <= 24'hdef3f4;
                10'd6:
                    r_pixel_data <= 24'he1f5f4;
                10'd7:
                    r_pixel_data <= 24'he6f6f5;
                10'd8:
                    r_pixel_data <= 24'he8f3f5;
                10'd9:
                    r_pixel_data <= 24'hebf5f7;
                10'd10:
                    r_pixel_data <= 24'hedf4fa;
                10'd11:
                    r_pixel_data <= 24'heef5fb;
                10'd12:
                    r_pixel_data <= 24'hf3f8fc;
                10'd13:
                    r_pixel_data <= 24'hf4f7fc;
                10'd14:
                    r_pixel_data <= 24'hf6f7fb;
                10'd15:
                    r_pixel_data <= 24'hf5f9fc;
                10'd16:
                    r_pixel_data <= 24'hf6fbfe;
                10'd17:
                    r_pixel_data <= 24'hf4feff;
                10'd18:
                    r_pixel_data <= 24'hf4ffff;
                10'd19:
                    r_pixel_data <= 24'hf7ffff;
                10'd20:
                    r_pixel_data <= 24'hfefcff;
                10'd21:
                    r_pixel_data <= 24'hfffbff;
                10'd22:
                    r_pixel_data <= 24'hfafeff;
                10'd23:
                    r_pixel_data <= 24'hf8fefe;
                10'd24:
                    r_pixel_data <= 24'hfcfdff;
                10'd25:
                    r_pixel_data <= 24'hfbfcfe;
                10'd26:
                    r_pixel_data <= 24'hf9fdfe;
                10'd27:
                    r_pixel_data <= 24'hf9fdfe;
                10'd28:
                    r_pixel_data <= 24'hfcfdff;
                10'd29:
                    r_pixel_data <= 24'hfdfeff;
                10'd30:
                    r_pixel_data <= 24'he4e7fa;
                10'd31:
                    r_pixel_data <= 24'he3e9f9;
                10'd32:
                    r_pixel_data <= 24'he1edf9;
                10'd33:
                    r_pixel_data <= 24'hdff0f8;
                10'd34:
                    r_pixel_data <= 24'hdff2f8;
                10'd35:
                    r_pixel_data <= 24'he0f3f7;
                10'd36:
                    r_pixel_data <= 24'he4f3f6;
                10'd37:
                    r_pixel_data <= 24'he7f5f6;
                10'd38:
                    r_pixel_data <= 24'hebf5f7;
                10'd39:
                    r_pixel_data <= 24'hedf5f8;
                10'd40:
                    r_pixel_data <= 24'heef5fb;
                10'd41:
                    r_pixel_data <= 24'hf1f6fc;
                10'd42:
                    r_pixel_data <= 24'hf3f8fc;
                10'd43:
                    r_pixel_data <= 24'hf5f8fd;
                10'd44:
                    r_pixel_data <= 24'hf7f8fd;
                10'd45:
                    r_pixel_data <= 24'hf6fafd;
                10'd46:
                    r_pixel_data <= 24'hf6fbfe;
                10'd47:
                    r_pixel_data <= 24'hf5fdff;
                10'd48:
                    r_pixel_data <= 24'hf4ffff;
                10'd49:
                    r_pixel_data <= 24'hf6feff;
                10'd50:
                    r_pixel_data <= 24'hfffbff;
                10'd51:
                    r_pixel_data <= 24'hfffaff;
                10'd52:
                    r_pixel_data <= 24'hfcfdff;
                10'd53:
                    r_pixel_data <= 24'hf9ffff;
                10'd54:
                    r_pixel_data <= 24'hfbfcfe;
                10'd55:
                    r_pixel_data <= 24'hfbfcfe;
                10'd56:
                    r_pixel_data <= 24'hf9fdfe;
                10'd57:
                    r_pixel_data <= 24'hfafeff;
                10'd58:
                    r_pixel_data <= 24'hfcfdff;
                10'd59:
                    r_pixel_data <= 24'hfcfdff;
                10'd60:
                    r_pixel_data <= 24'he1e8fa;
                10'd61:
                    r_pixel_data <= 24'he2ebfc;
                10'd62:
                    r_pixel_data <= 24'he2eefc;
                10'd63:
                    r_pixel_data <= 24'he3effd;
                10'd64:
                    r_pixel_data <= 24'he4f0fc;
                10'd65:
                    r_pixel_data <= 24'he5f2fb;
                10'd66:
                    r_pixel_data <= 24'he8f2fb;
                10'd67:
                    r_pixel_data <= 24'heaf3fa;
                10'd68:
                    r_pixel_data <= 24'heff4fa;
                10'd69:
                    r_pixel_data <= 24'hf1f6fc;
                10'd70:
                    r_pixel_data <= 24'hf1f6fa;
                10'd71:
                    r_pixel_data <= 24'hf3f6fb;
                10'd72:
                    r_pixel_data <= 24'hf6f9ff;
                10'd73:
                    r_pixel_data <= 24'hf6f9ff;
                10'd74:
                    r_pixel_data <= 24'hf9f9ff;
                10'd75:
                    r_pixel_data <= 24'hfafaff;
                10'd76:
                    r_pixel_data <= 24'hf8fcff;
                10'd77:
                    r_pixel_data <= 24'hf8fefe;
                10'd78:
                    r_pixel_data <= 24'hf5fffe;
                10'd79:
                    r_pixel_data <= 24'hf8fefe;
                10'd80:
                    r_pixel_data <= 24'hfffbff;
                10'd81:
                    r_pixel_data <= 24'hfffaff;
                10'd82:
                    r_pixel_data <= 24'hfdfdff;
                10'd83:
                    r_pixel_data <= 24'hfcfdff;
                10'd84:
                    r_pixel_data <= 24'hfbfcfe;
                10'd85:
                    r_pixel_data <= 24'hfbfcfe;
                10'd86:
                    r_pixel_data <= 24'hfafeff;
                10'd87:
                    r_pixel_data <= 24'hfafeff;
                10'd88:
                    r_pixel_data <= 24'hfcfdff;
                10'd89:
                    r_pixel_data <= 24'hfdfdff;
                10'd90:
                    r_pixel_data <= 24'hdeebfb;
                10'd91:
                    r_pixel_data <= 24'he0ecfc;
                10'd92:
                    r_pixel_data <= 24'he2eefe;
                10'd93:
                    r_pixel_data <= 24'he4f0fe;
                10'd94:
                    r_pixel_data <= 24'he7f0ff;
                10'd95:
                    r_pixel_data <= 24'he9f1fe;
                10'd96:
                    r_pixel_data <= 24'hebf1fd;
                10'd97:
                    r_pixel_data <= 24'heef2fb;
                10'd98:
                    r_pixel_data <= 24'hf2f5fc;
                10'd99:
                    r_pixel_data <= 24'hf3f6fd;
                10'd100:
                    r_pixel_data <= 24'hf3f6fb;
                10'd101:
                    r_pixel_data <= 24'hf4f7fc;
                10'd102:
                    r_pixel_data <= 24'hf7faff;
                10'd103:
                    r_pixel_data <= 24'hf7faff;
                10'd104:
                    r_pixel_data <= 24'hf8fbff;
                10'd105:
                    r_pixel_data <= 24'hf9fcff;
                10'd106:
                    r_pixel_data <= 24'hfbfcff;
                10'd107:
                    r_pixel_data <= 24'hf9fdfe;
                10'd108:
                    r_pixel_data <= 24'hf6fffe;
                10'd109:
                    r_pixel_data <= 24'hf8fefe;
                10'd110:
                    r_pixel_data <= 24'hfffbff;
                10'd111:
                    r_pixel_data <= 24'hfffaff;
                10'd112:
                    r_pixel_data <= 24'hfefcff;
                10'd113:
                    r_pixel_data <= 24'hfdfeff;
                10'd114:
                    r_pixel_data <= 24'hfdfeff;
                10'd115:
                    r_pixel_data <= 24'hfdfeff;
                10'd116:
                    r_pixel_data <= 24'hfbffff;
                10'd117:
                    r_pixel_data <= 24'hfbffff;
                10'd118:
                    r_pixel_data <= 24'hfdfeff;
                10'd119:
                    r_pixel_data <= 24'hfdfdff;
                10'd120:
                    r_pixel_data <= 24'hdbedf9;
                10'd121:
                    r_pixel_data <= 24'hddeffb;
                10'd122:
                    r_pixel_data <= 24'he1effc;
                10'd123:
                    r_pixel_data <= 24'he3effd;
                10'd124:
                    r_pixel_data <= 24'he7eefe;
                10'd125:
                    r_pixel_data <= 24'heaf0fe;
                10'd126:
                    r_pixel_data <= 24'hecf2fe;
                10'd127:
                    r_pixel_data <= 24'hf0f4ff;
                10'd128:
                    r_pixel_data <= 24'hf2f5fe;
                10'd129:
                    r_pixel_data <= 24'hf4f7fe;
                10'd130:
                    r_pixel_data <= 24'hf4f7fc;
                10'd131:
                    r_pixel_data <= 24'hf6f9fe;
                10'd132:
                    r_pixel_data <= 24'hf7fcff;
                10'd133:
                    r_pixel_data <= 24'hf7fcff;
                10'd134:
                    r_pixel_data <= 24'hf5fdff;
                10'd135:
                    r_pixel_data <= 24'hf8fdff;
                10'd136:
                    r_pixel_data <= 24'hfdfcff;
                10'd137:
                    r_pixel_data <= 24'hfdfcff;
                10'd138:
                    r_pixel_data <= 24'hf7ffff;
                10'd139:
                    r_pixel_data <= 24'hf9feff;
                10'd140:
                    r_pixel_data <= 24'hfffbff;
                10'd141:
                    r_pixel_data <= 24'hfffaff;
                10'd142:
                    r_pixel_data <= 24'hfefdff;
                10'd143:
                    r_pixel_data <= 24'hfdfeff;
                10'd144:
                    r_pixel_data <= 24'hfffeff;
                10'd145:
                    r_pixel_data <= 24'hfffeff;
                10'd146:
                    r_pixel_data <= 24'hfdfeff;
                10'd147:
                    r_pixel_data <= 24'hfcfdff;
                10'd148:
                    r_pixel_data <= 24'hfdfcff;
                10'd149:
                    r_pixel_data <= 24'hfdfcff;
                10'd150:
                    r_pixel_data <= 24'hd9effa;
                10'd151:
                    r_pixel_data <= 24'hdcf0fb;
                10'd152:
                    r_pixel_data <= 24'hdff0fa;
                10'd153:
                    r_pixel_data <= 24'he3effb;
                10'd154:
                    r_pixel_data <= 24'he8f0fb;
                10'd155:
                    r_pixel_data <= 24'hebf2fc;
                10'd156:
                    r_pixel_data <= 24'hedf4fe;
                10'd157:
                    r_pixel_data <= 24'hf1f5fe;
                10'd158:
                    r_pixel_data <= 24'hf3f6fd;
                10'd159:
                    r_pixel_data <= 24'hf5f8fd;
                10'd160:
                    r_pixel_data <= 24'hf5f8fd;
                10'd161:
                    r_pixel_data <= 24'hf7fbfe;
                10'd162:
                    r_pixel_data <= 24'hf9fdff;
                10'd163:
                    r_pixel_data <= 24'hf8fefe;
                10'd164:
                    r_pixel_data <= 24'hf6fffe;
                10'd165:
                    r_pixel_data <= 24'hf9ffff;
                10'd166:
                    r_pixel_data <= 24'hfefdff;
                10'd167:
                    r_pixel_data <= 24'hfefdff;
                10'd168:
                    r_pixel_data <= 24'hf9feff;
                10'd169:
                    r_pixel_data <= 24'hfafdff;
                10'd170:
                    r_pixel_data <= 24'hfefbff;
                10'd171:
                    r_pixel_data <= 24'hfffbff;
                10'd172:
                    r_pixel_data <= 24'hfefdff;
                10'd173:
                    r_pixel_data <= 24'hfdfeff;
                10'd174:
                    r_pixel_data <= 24'hfdfeff;
                10'd175:
                    r_pixel_data <= 24'hfefdff;
                10'd176:
                    r_pixel_data <= 24'hfdfcff;
                10'd177:
                    r_pixel_data <= 24'hfdfcff;
                10'd178:
                    r_pixel_data <= 24'hfbfcff;
                10'd179:
                    r_pixel_data <= 24'hfcfdff;
                10'd180:
                    r_pixel_data <= 24'hdbedf7;
                10'd181:
                    r_pixel_data <= 24'hdceef8;
                10'd182:
                    r_pixel_data <= 24'he1eff8;
                10'd183:
                    r_pixel_data <= 24'he4f1f9;
                10'd184:
                    r_pixel_data <= 24'he8f1f8;
                10'd185:
                    r_pixel_data <= 24'hebf2f8;
                10'd186:
                    r_pixel_data <= 24'hedf4fa;
                10'd187:
                    r_pixel_data <= 24'hf1f6fc;
                10'd188:
                    r_pixel_data <= 24'hf3f6fb;
                10'd189:
                    r_pixel_data <= 24'hf5f8fd;
                10'd190:
                    r_pixel_data <= 24'hf9faff;
                10'd191:
                    r_pixel_data <= 24'hfafbff;
                10'd192:
                    r_pixel_data <= 24'hfcfefd;
                10'd193:
                    r_pixel_data <= 24'hfafffb;
                10'd194:
                    r_pixel_data <= 24'hf7fffb;
                10'd195:
                    r_pixel_data <= 24'hf9fffb;
                10'd196:
                    r_pixel_data <= 24'hfdfeff;
                10'd197:
                    r_pixel_data <= 24'hfdfeff;
                10'd198:
                    r_pixel_data <= 24'hfbffff;
                10'd199:
                    r_pixel_data <= 24'hfdfeff;
                10'd200:
                    r_pixel_data <= 24'hfffcff;
                10'd201:
                    r_pixel_data <= 24'hfffcff;
                10'd202:
                    r_pixel_data <= 24'hfefdff;
                10'd203:
                    r_pixel_data <= 24'hfdfeff;
                10'd204:
                    r_pixel_data <= 24'hfcfdff;
                10'd205:
                    r_pixel_data <= 24'hfcfdff;
                10'd206:
                    r_pixel_data <= 24'hfcfdff;
                10'd207:
                    r_pixel_data <= 24'hfcfdff;
                10'd208:
                    r_pixel_data <= 24'hfafefd;
                10'd209:
                    r_pixel_data <= 24'hf9fffd;
                10'd210:
                    r_pixel_data <= 24'hdbecf6;
                10'd211:
                    r_pixel_data <= 24'hdfedf6;
                10'd212:
                    r_pixel_data <= 24'he3f0f9;
                10'd213:
                    r_pixel_data <= 24'he7f1fa;
                10'd214:
                    r_pixel_data <= 24'he8f3f7;
                10'd215:
                    r_pixel_data <= 24'heaf3f8;
                10'd216:
                    r_pixel_data <= 24'hecf6f8;
                10'd217:
                    r_pixel_data <= 24'heef6f9;
                10'd218:
                    r_pixel_data <= 24'hf4f7fc;
                10'd219:
                    r_pixel_data <= 24'hf8f9fd;
                10'd220:
                    r_pixel_data <= 24'hfaf9fe;
                10'd221:
                    r_pixel_data <= 24'hfdfbfe;
                10'd222:
                    r_pixel_data <= 24'hfefefe;
                10'd223:
                    r_pixel_data <= 24'hfdfffc;
                10'd224:
                    r_pixel_data <= 24'hfafff9;
                10'd225:
                    r_pixel_data <= 24'hfafffb;
                10'd226:
                    r_pixel_data <= 24'hfbfffe;
                10'd227:
                    r_pixel_data <= 24'hfdfeff;
                10'd228:
                    r_pixel_data <= 24'hfdfeff;
                10'd229:
                    r_pixel_data <= 24'hfdfeff;
                10'd230:
                    r_pixel_data <= 24'hfffdff;
                10'd231:
                    r_pixel_data <= 24'hfefeff;
                10'd232:
                    r_pixel_data <= 24'hfdfffe;
                10'd233:
                    r_pixel_data <= 24'hfdfffe;
                10'd234:
                    r_pixel_data <= 24'hfffcfb;
                10'd235:
                    r_pixel_data <= 24'hfffbfc;
                10'd236:
                    r_pixel_data <= 24'hfffafc;
                10'd237:
                    r_pixel_data <= 24'hfffcfb;
                10'd238:
                    r_pixel_data <= 24'hfffefb;
                10'd239:
                    r_pixel_data <= 24'hfffefb;
                10'd240:
                    r_pixel_data <= 24'hdee6f1;
                10'd241:
                    r_pixel_data <= 24'he5eff9;
                10'd242:
                    r_pixel_data <= 24'he4eef8;
                10'd243:
                    r_pixel_data <= 24'he4eef7;
                10'd244:
                    r_pixel_data <= 24'he6f0f9;
                10'd245:
                    r_pixel_data <= 24'he9f4fa;
                10'd246:
                    r_pixel_data <= 24'hecf5fa;
                10'd247:
                    r_pixel_data <= 24'heff7fa;
                10'd248:
                    r_pixel_data <= 24'hf6f9fe;
                10'd249:
                    r_pixel_data <= 24'hf8f7fc;
                10'd250:
                    r_pixel_data <= 24'hfef9fd;
                10'd251:
                    r_pixel_data <= 24'hfffeff;
                10'd252:
                    r_pixel_data <= 24'hfffdfe;
                10'd253:
                    r_pixel_data <= 24'hfffcfd;
                10'd254:
                    r_pixel_data <= 24'hfffffd;
                10'd255:
                    r_pixel_data <= 24'hfcfcfa;
                10'd256:
                    r_pixel_data <= 24'hfbfdfc;
                10'd257:
                    r_pixel_data <= 24'hfcffff;
                10'd258:
                    r_pixel_data <= 24'hfcffff;
                10'd259:
                    r_pixel_data <= 24'hf8fefc;
                10'd260:
                    r_pixel_data <= 24'hf8fffe;
                10'd261:
                    r_pixel_data <= 24'hf9ffff;
                10'd262:
                    r_pixel_data <= 24'hfafffc;
                10'd263:
                    r_pixel_data <= 24'hfffdfc;
                10'd264:
                    r_pixel_data <= 24'hfff8fa;
                10'd265:
                    r_pixel_data <= 24'hfff5fa;
                10'd266:
                    r_pixel_data <= 24'hf5ccd4;
                10'd267:
                    r_pixel_data <= 24'he2b9bf;
                10'd268:
                    r_pixel_data <= 24'hceaeb1;
                10'd269:
                    r_pixel_data <= 24'h8f7574;
                10'd270:
                    r_pixel_data <= 24'he3ebf6;
                10'd271:
                    r_pixel_data <= 24'he2eaf5;
                10'd272:
                    r_pixel_data <= 24'hdce8f4;
                10'd273:
                    r_pixel_data <= 24'he2f0fb;
                10'd274:
                    r_pixel_data <= 24'he2f0f9;
                10'd275:
                    r_pixel_data <= 24'he7f5fe;
                10'd276:
                    r_pixel_data <= 24'hebf6fc;
                10'd277:
                    r_pixel_data <= 24'hf0f7fd;
                10'd278:
                    r_pixel_data <= 24'hf4f8fb;
                10'd279:
                    r_pixel_data <= 24'hfafafc;
                10'd280:
                    r_pixel_data <= 24'hfbf9fa;
                10'd281:
                    r_pixel_data <= 24'hfcfafb;
                10'd282:
                    r_pixel_data <= 24'hfefafb;
                10'd283:
                    r_pixel_data <= 24'hfffdff;
                10'd284:
                    r_pixel_data <= 24'hfffafe;
                10'd285:
                    r_pixel_data <= 24'hfffdff;
                10'd286:
                    r_pixel_data <= 24'hfffeff;
                10'd287:
                    r_pixel_data <= 24'hfffeff;
                10'd288:
                    r_pixel_data <= 24'hfdfdfd;
                10'd289:
                    r_pixel_data <= 24'hf7fbfa;
                10'd290:
                    r_pixel_data <= 24'hf8ffff;
                10'd291:
                    r_pixel_data <= 24'hecf7f3;
                10'd292:
                    r_pixel_data <= 24'hc7cdc9;
                10'd293:
                    r_pixel_data <= 24'h999393;
                10'd294:
                    r_pixel_data <= 24'h674c51;
                10'd295:
                    r_pixel_data <= 24'h50252f;
                10'd296:
                    r_pixel_data <= 24'h662e3b;
                10'd297:
                    r_pixel_data <= 24'h66313b;
                10'd298:
                    r_pixel_data <= 24'h532a30;
                10'd299:
                    r_pixel_data <= 24'h916f70;
                10'd300:
                    r_pixel_data <= 24'hdce6f2;
                10'd301:
                    r_pixel_data <= 24'hdde9f5;
                10'd302:
                    r_pixel_data <= 24'hddedfa;
                10'd303:
                    r_pixel_data <= 24'hdceffd;
                10'd304:
                    r_pixel_data <= 24'he3f6ff;
                10'd305:
                    r_pixel_data <= 24'hdef0fc;
                10'd306:
                    r_pixel_data <= 24'he8f6ff;
                10'd307:
                    r_pixel_data <= 24'hedf6fd;
                10'd308:
                    r_pixel_data <= 24'hf6fbff;
                10'd309:
                    r_pixel_data <= 24'hf6fafb;
                10'd310:
                    r_pixel_data <= 24'hf9fdfc;
                10'd311:
                    r_pixel_data <= 24'hfafefd;
                10'd312:
                    r_pixel_data <= 24'hfeffff;
                10'd313:
                    r_pixel_data <= 24'hfffdff;
                10'd314:
                    r_pixel_data <= 24'ha8a0ad;
                10'd315:
                    r_pixel_data <= 24'hd7cbd7;
                10'd316:
                    r_pixel_data <= 24'hfff9ff;
                10'd317:
                    r_pixel_data <= 24'hebdce3;
                10'd318:
                    r_pixel_data <= 24'hb1a6ac;
                10'd319:
                    r_pixel_data <= 24'hb5b0b4;
                10'd320:
                    r_pixel_data <= 24'h797f7f;
                10'd321:
                    r_pixel_data <= 24'h535c5b;
                10'd322:
                    r_pixel_data <= 24'h393d3e;
                10'd323:
                    r_pixel_data <= 24'h2d2429;
                10'd324:
                    r_pixel_data <= 24'h4c303c;
                10'd325:
                    r_pixel_data <= 24'h643a48;
                10'd326:
                    r_pixel_data <= 24'h743f51;
                10'd327:
                    r_pixel_data <= 24'h915e6d;
                10'd328:
                    r_pixel_data <= 24'hc5a2a9;
                10'd329:
                    r_pixel_data <= 24'heed1d6;
                10'd330:
                    r_pixel_data <= 24'hdbe9f6;
                10'd331:
                    r_pixel_data <= 24'hddedfa;
                10'd332:
                    r_pixel_data <= 24'hdbeefc;
                10'd333:
                    r_pixel_data <= 24'hd6ecf9;
                10'd334:
                    r_pixel_data <= 24'hdaeef9;
                10'd335:
                    r_pixel_data <= 24'he3f4fe;
                10'd336:
                    r_pixel_data <= 24'heaf4fd;
                10'd337:
                    r_pixel_data <= 24'hedf4fa;
                10'd338:
                    r_pixel_data <= 24'heff4f7;
                10'd339:
                    r_pixel_data <= 24'hf7fdfd;
                10'd340:
                    r_pixel_data <= 24'hf3fcf9;
                10'd341:
                    r_pixel_data <= 24'hf9ffff;
                10'd342:
                    r_pixel_data <= 24'hfbffff;
                10'd343:
                    r_pixel_data <= 24'hcccbd3;
                10'd344:
                    r_pixel_data <= 24'h746977;
                10'd345:
                    r_pixel_data <= 24'h6a5969;
                10'd346:
                    r_pixel_data <= 24'h6d5764;
                10'd347:
                    r_pixel_data <= 24'hc6b0bc;
                10'd348:
                    r_pixel_data <= 24'h3a2933;
                10'd349:
                    r_pixel_data <= 24'h30252d;
                10'd350:
                    r_pixel_data <= 24'h29242a;
                10'd351:
                    r_pixel_data <= 24'h232227;
                10'd352:
                    r_pixel_data <= 24'h67656a;
                10'd353:
                    r_pixel_data <= 24'hb8aeb7;
                10'd354:
                    r_pixel_data <= 24'hecd8e4;
                10'd355:
                    r_pixel_data <= 24'hf6d7e7;
                10'd356:
                    r_pixel_data <= 24'hffeeff;
                10'd357:
                    r_pixel_data <= 24'hfff1ff;
                10'd358:
                    r_pixel_data <= 24'hfff7ff;
                10'd359:
                    r_pixel_data <= 24'hfff8ff;
                10'd360:
                    r_pixel_data <= 24'hd9ecfb;
                10'd361:
                    r_pixel_data <= 24'hd2e5f3;
                10'd362:
                    r_pixel_data <= 24'he3fbff;
                10'd363:
                    r_pixel_data <= 24'he5fcff;
                10'd364:
                    r_pixel_data <= 24'he8fbff;
                10'd365:
                    r_pixel_data <= 24'he9f4fa;
                10'd366:
                    r_pixel_data <= 24'hf8fbff;
                10'd367:
                    r_pixel_data <= 24'hf9fafe;
                10'd368:
                    r_pixel_data <= 24'hfafbfd;
                10'd369:
                    r_pixel_data <= 24'hf3f9f9;
                10'd370:
                    r_pixel_data <= 24'hf4fffe;
                10'd371:
                    r_pixel_data <= 24'hf3ffff;
                10'd372:
                    r_pixel_data <= 24'hf9ffff;
                10'd373:
                    r_pixel_data <= 24'h848389;
                10'd374:
                    r_pixel_data <= 24'h352734;
                10'd375:
                    r_pixel_data <= 24'h523c49;
                10'd376:
                    r_pixel_data <= 24'h59424c;
                10'd377:
                    r_pixel_data <= 24'h5e4751;
                10'd378:
                    r_pixel_data <= 24'h6a555e;
                10'd379:
                    r_pixel_data <= 24'h35212a;
                10'd380:
                    r_pixel_data <= 24'h2c1b25;
                10'd381:
                    r_pixel_data <= 24'h7e6e78;
                10'd382:
                    r_pixel_data <= 24'hafa2ac;
                10'd383:
                    r_pixel_data <= 24'heee2ee;
                10'd384:
                    r_pixel_data <= 24'hfffcff;
                10'd385:
                    r_pixel_data <= 24'hfffbff;
                10'd386:
                    r_pixel_data <= 24'hb9adbb;
                10'd387:
                    r_pixel_data <= 24'h928694;
                10'd388:
                    r_pixel_data <= 24'h706a74;
                10'd389:
                    r_pixel_data <= 24'hfffeff;
                10'd390:
                    r_pixel_data <= 24'hdaecff;
                10'd391:
                    r_pixel_data <= 24'haec1d0;
                10'd392:
                    r_pixel_data <= 24'h80979f;
                10'd393:
                    r_pixel_data <= 24'h64777b;
                10'd394:
                    r_pixel_data <= 24'ha9b5b5;
                10'd395:
                    r_pixel_data <= 24'hced0cf;
                10'd396:
                    r_pixel_data <= 24'hb9b0b1;
                10'd397:
                    r_pixel_data <= 24'hc4babb;
                10'd398:
                    r_pixel_data <= 24'hcfc9cb;
                10'd399:
                    r_pixel_data <= 24'hfffeff;
                10'd400:
                    r_pixel_data <= 24'hf7ffff;
                10'd401:
                    r_pixel_data <= 24'hf7ffff;
                10'd402:
                    r_pixel_data <= 24'hc7ccd0;
                10'd403:
                    r_pixel_data <= 24'h2a232a;
                10'd404:
                    r_pixel_data <= 24'h3b242e;
                10'd405:
                    r_pixel_data <= 24'h5b3a45;
                10'd406:
                    r_pixel_data <= 24'h4e2931;
                10'd407:
                    r_pixel_data <= 24'h4b262e;
                10'd408:
                    r_pixel_data <= 24'h58373e;
                10'd409:
                    r_pixel_data <= 24'h45262e;
                10'd410:
                    r_pixel_data <= 24'h3e1e29;
                10'd411:
                    r_pixel_data <= 24'h2c0c19;
                10'd412:
                    r_pixel_data <= 24'h210513;
                10'd413:
                    r_pixel_data <= 24'h16020e;
                10'd414:
                    r_pixel_data <= 24'h29242b;
                10'd415:
                    r_pixel_data <= 24'h4c4c54;
                10'd416:
                    r_pixel_data <= 24'h2f2935;
                10'd417:
                    r_pixel_data <= 24'h3f3945;
                10'd418:
                    r_pixel_data <= 24'h13111c;
                10'd419:
                    r_pixel_data <= 24'h12151e;
                10'd420:
                    r_pixel_data <= 24'hd7e7fe;
                10'd421:
                    r_pixel_data <= 24'he1f0ff;
                10'd422:
                    r_pixel_data <= 24'hecfbff;
                10'd423:
                    r_pixel_data <= 24'h9ea8a7;
                10'd424:
                    r_pixel_data <= 24'h29291f;
                10'd425:
                    r_pixel_data <= 24'hf0500;
                10'd426:
                    r_pixel_data <= 24'h2b140e;
                10'd427:
                    r_pixel_data <= 24'h220807;
                10'd428:
                    r_pixel_data <= 24'h1c070c;
                10'd429:
                    r_pixel_data <= 24'h433840;
                10'd430:
                    r_pixel_data <= 24'h868992;
                10'd431:
                    r_pixel_data <= 24'hd6dae3;
                10'd432:
                    r_pixel_data <= 24'h5d5c62;
                10'd433:
                    r_pixel_data <= 24'h2d1e23;
                10'd434:
                    r_pixel_data <= 24'h3d1a20;
                10'd435:
                    r_pixel_data <= 24'h521f26;
                10'd436:
                    r_pixel_data <= 24'h571820;
                10'd437:
                    r_pixel_data <= 24'h5c1b23;
                10'd438:
                    r_pixel_data <= 24'h541d22;
                10'd439:
                    r_pixel_data <= 24'h4b1a1e;
                10'd440:
                    r_pixel_data <= 24'h400f15;
                10'd441:
                    r_pixel_data <= 24'h3e0f19;
                10'd442:
                    r_pixel_data <= 24'h390b16;
                10'd443:
                    r_pixel_data <= 24'h36121c;
                10'd444:
                    r_pixel_data <= 24'h23141b;
                10'd445:
                    r_pixel_data <= 24'h190f17;
                10'd446:
                    r_pixel_data <= 24'h40303b;
                10'd447:
                    r_pixel_data <= 24'h372531;
                10'd448:
                    r_pixel_data <= 24'h291d29;
                10'd449:
                    r_pixel_data <= 24'h180e19;
                10'd450:
                    r_pixel_data <= 24'hd9e5fb;
                10'd451:
                    r_pixel_data <= 24'hd7e3f3;
                10'd452:
                    r_pixel_data <= 24'hf1fcff;
                10'd453:
                    r_pixel_data <= 24'h41443d;
                10'd454:
                    r_pixel_data <= 24'h5e5244;
                10'd455:
                    r_pixel_data <= 24'hb59b8c;
                10'd456:
                    r_pixel_data <= 24'hb38b81;
                10'd457:
                    r_pixel_data <= 24'h7e5551;
                10'd458:
                    r_pixel_data <= 24'h614144;
                10'd459:
                    r_pixel_data <= 24'h422f35;
                10'd460:
                    r_pixel_data <= 24'h29262d;
                10'd461:
                    r_pixel_data <= 24'h181820;
                10'd462:
                    r_pixel_data <= 24'hf060b;
                10'd463:
                    r_pixel_data <= 24'h331d20;
                10'd464:
                    r_pixel_data <= 24'h51292a;
                10'd465:
                    r_pixel_data <= 24'h591e22;
                10'd466:
                    r_pixel_data <= 24'h92474e;
                10'd467:
                    r_pixel_data <= 24'h93464c;
                10'd468:
                    r_pixel_data <= 24'h5f1d1f;
                10'd469:
                    r_pixel_data <= 24'h65292b;
                10'd470:
                    r_pixel_data <= 24'h571a21;
                10'd471:
                    r_pixel_data <= 24'h490d15;
                10'd472:
                    r_pixel_data <= 24'h4a0e16;
                10'd473:
                    r_pixel_data <= 24'h4f2026;
                10'd474:
                    r_pixel_data <= 24'h281215;
                10'd475:
                    r_pixel_data <= 24'h3d2c32;
                10'd476:
                    r_pixel_data <= 24'h71505b;
                10'd477:
                    r_pixel_data <= 24'h664452;
                10'd478:
                    r_pixel_data <= 24'h4a3441;
                10'd479:
                    r_pixel_data <= 24'h20101b;
                10'd480:
                    r_pixel_data <= 24'hdae2f5;
                10'd481:
                    r_pixel_data <= 24'he0e8f3;
                10'd482:
                    r_pixel_data <= 24'hf2fbfa;
                10'd483:
                    r_pixel_data <= 24'h6e6c60;
                10'd484:
                    r_pixel_data <= 24'ha99282;
                10'd485:
                    r_pixel_data <= 24'had8272;
                10'd486:
                    r_pixel_data <= 24'h743a2f;
                10'd487:
                    r_pixel_data <= 24'h612620;
                10'd488:
                    r_pixel_data <= 24'h4b2220;
                10'd489:
                    r_pixel_data <= 24'h664e4e;
                10'd490:
                    r_pixel_data <= 24'h777171;
                10'd491:
                    r_pixel_data <= 24'h191516;
                10'd492:
                    r_pixel_data <= 24'h3c2d30;
                10'd493:
                    r_pixel_data <= 24'h3a2021;
                10'd494:
                    r_pixel_data <= 24'h7e5455;
                10'd495:
                    r_pixel_data <= 24'h4a0f11;
                10'd496:
                    r_pixel_data <= 24'h530b0f;
                10'd497:
                    r_pixel_data <= 24'h4a0003;
                10'd498:
                    r_pixel_data <= 24'h672624;
                10'd499:
                    r_pixel_data <= 24'h4c0c0c;
                10'd500:
                    r_pixel_data <= 24'h58171d;
                10'd501:
                    r_pixel_data <= 24'h4b050d;
                10'd502:
                    r_pixel_data <= 24'h682023;
                10'd503:
                    r_pixel_data <= 24'h4b1314;
                10'd504:
                    r_pixel_data <= 24'h2d1817;
                10'd505:
                    r_pixel_data <= 24'h553f42;
                10'd506:
                    r_pixel_data <= 24'h541c27;
                10'd507:
                    r_pixel_data <= 24'h975a6a;
                10'd508:
                    r_pixel_data <= 24'h6c4758;
                10'd509:
                    r_pixel_data <= 24'h260d20;
                10'd510:
                    r_pixel_data <= 24'hd3e0f3;
                10'd511:
                    r_pixel_data <= 24'haab6c4;
                10'd512:
                    r_pixel_data <= 24'h889395;
                10'd513:
                    r_pixel_data <= 24'h686b64;
                10'd514:
                    r_pixel_data <= 24'h998b80;
                10'd515:
                    r_pixel_data <= 24'h311308;
                10'd516:
                    r_pixel_data <= 24'h451812;
                10'd517:
                    r_pixel_data <= 24'h562a27;
                10'd518:
                    r_pixel_data <= 24'h7f6161;
                10'd519:
                    r_pixel_data <= 24'hbfafb0;
                10'd520:
                    r_pixel_data <= 24'ha2a0a3;
                10'd521:
                    r_pixel_data <= 24'hc8c8ca;
                10'd522:
                    r_pixel_data <= 24'h2f2325;
                10'd523:
                    r_pixel_data <= 24'h624549;
                10'd524:
                    r_pixel_data <= 24'h4d1f21;
                10'd525:
                    r_pixel_data <= 24'h5c2022;
                10'd526:
                    r_pixel_data <= 24'hb46970;
                10'd527:
                    r_pixel_data <= 24'hda8e92;
                10'd528:
                    r_pixel_data <= 24'h410000;
                10'd529:
                    r_pixel_data <= 24'h9f5d5e;
                10'd530:
                    r_pixel_data <= 24'h5f1921;
                10'd531:
                    r_pixel_data <= 24'h631c24;
                10'd532:
                    r_pixel_data <= 24'h5a1215;
                10'd533:
                    r_pixel_data <= 24'h7f4746;
                10'd534:
                    r_pixel_data <= 24'h281413;
                10'd535:
                    r_pixel_data <= 24'h473436;
                10'd536:
                    r_pixel_data <= 24'h97646b;
                10'd537:
                    r_pixel_data <= 24'h7d4550;
                10'd538:
                    r_pixel_data <= 24'h563746;
                10'd539:
                    r_pixel_data <= 24'h281624;
                10'd540:
                    r_pixel_data <= 24'hcce1fc;
                10'd541:
                    r_pixel_data <= 24'hd2e8ff;
                10'd542:
                    r_pixel_data <= 24'hdaf0fe;
                10'd543:
                    r_pixel_data <= 24'he6faff;
                10'd544:
                    r_pixel_data <= 24'he0f0f0;
                10'd545:
                    r_pixel_data <= 24'hf0faf9;
                10'd546:
                    r_pixel_data <= 24'heff3f4;
                10'd547:
                    r_pixel_data <= 24'hd8d9de;
                10'd548:
                    r_pixel_data <= 24'hf0f2fe;
                10'd549:
                    r_pixel_data <= 24'heef4ff;
                10'd550:
                    r_pixel_data <= 24'heaf6ff;
                10'd551:
                    r_pixel_data <= 24'hf8ffff;
                10'd552:
                    r_pixel_data <= 24'h3c353d;
                10'd553:
                    r_pixel_data <= 24'h51363d;
                10'd554:
                    r_pixel_data <= 24'h4f1c23;
                10'd555:
                    r_pixel_data <= 24'h6b232e;
                10'd556:
                    r_pixel_data <= 24'h7c2631;
                10'd557:
                    r_pixel_data <= 24'h7f2c34;
                10'd558:
                    r_pixel_data <= 24'h480204;
                10'd559:
                    r_pixel_data <= 24'h571517;
                10'd560:
                    r_pixel_data <= 24'h4a000f;
                10'd561:
                    r_pixel_data <= 24'h651d2b;
                10'd562:
                    r_pixel_data <= 24'h430208;
                10'd563:
                    r_pixel_data <= 24'h4b1f20;
                10'd564:
                    r_pixel_data <= 24'hf0305;
                10'd565:
                    r_pixel_data <= 24'ha0607;
                10'd566:
                    r_pixel_data <= 24'h513b3d;
                10'd567:
                    r_pixel_data <= 24'h493335;
                10'd568:
                    r_pixel_data <= 24'h433a3f;
                10'd569:
                    r_pixel_data <= 24'h1a1921;
                10'd570:
                    r_pixel_data <= 24'hc3defb;
                10'd571:
                    r_pixel_data <= 24'hcee8ff;
                10'd572:
                    r_pixel_data <= 24'hc7e0f6;
                10'd573:
                    r_pixel_data <= 24'hcbe5f4;
                10'd574:
                    r_pixel_data <= 24'hcde9f4;
                10'd575:
                    r_pixel_data <= 24'hcae7ef;
                10'd576:
                    r_pixel_data <= 24'hcbe8f0;
                10'd577:
                    r_pixel_data <= 24'hd5f0fb;
                10'd578:
                    r_pixel_data <= 24'hd6ebfc;
                10'd579:
                    r_pixel_data <= 24'hd7eafb;
                10'd580:
                    r_pixel_data <= 24'hdceffe;
                10'd581:
                    r_pixel_data <= 24'heaf8ff;
                10'd582:
                    r_pixel_data <= 24'hb7b6bc;
                10'd583:
                    r_pixel_data <= 24'h21080e;
                10'd584:
                    r_pixel_data <= 24'h4a121b;
                10'd585:
                    r_pixel_data <= 24'h550d18;
                10'd586:
                    r_pixel_data <= 24'h611823;
                10'd587:
                    r_pixel_data <= 24'h6b282f;
                10'd588:
                    r_pixel_data <= 24'h531d1d;
                10'd589:
                    r_pixel_data <= 24'h49171a;
                10'd590:
                    r_pixel_data <= 24'h450b19;
                10'd591:
                    r_pixel_data <= 24'h38000d;
                10'd592:
                    r_pixel_data <= 24'h2c0003;
                10'd593:
                    r_pixel_data <= 24'h331517;
                10'd594:
                    r_pixel_data <= 24'h877e83;
                10'd595:
                    r_pixel_data <= 24'h959499;
                10'd596:
                    r_pixel_data <= 24'h322d2a;
                10'd597:
                    r_pixel_data <= 24'h46423f;
                10'd598:
                    r_pixel_data <= 24'h181e1e;
                10'd599:
                    r_pixel_data <= 24'h1d2729;
                10'd600:
                    r_pixel_data <= 24'hc7e3fb;
                10'd601:
                    r_pixel_data <= 24'hc9e1f9;
                10'd602:
                    r_pixel_data <= 24'hcddff7;
                10'd603:
                    r_pixel_data <= 24'hcfe1f5;
                10'd604:
                    r_pixel_data <= 24'hcae1f1;
                10'd605:
                    r_pixel_data <= 24'hd0ecfa;
                10'd606:
                    r_pixel_data <= 24'hc8e8f5;
                10'd607:
                    r_pixel_data <= 24'hcbebfa;
                10'd608:
                    r_pixel_data <= 24'hcee9fa;
                10'd609:
                    r_pixel_data <= 24'hdaf1ff;
                10'd610:
                    r_pixel_data <= 24'hd4ecf8;
                10'd611:
                    r_pixel_data <= 24'he6f4fd;
                10'd612:
                    r_pixel_data <= 24'hd6d5da;
                10'd613:
                    r_pixel_data <= 24'h190306;
                10'd614:
                    r_pixel_data <= 24'h440f15;
                10'd615:
                    r_pixel_data <= 24'hb2757c;
                10'd616:
                    r_pixel_data <= 24'h270001;
                10'd617:
                    r_pixel_data <= 24'h2b0e10;
                10'd618:
                    r_pixel_data <= 24'h301d19;
                10'd619:
                    r_pixel_data <= 24'h251110;
                10'd620:
                    r_pixel_data <= 24'h1a0008;
                10'd621:
                    r_pixel_data <= 24'h917780;
                10'd622:
                    r_pixel_data <= 24'hfff8f8;
                10'd623:
                    r_pixel_data <= 24'hfffbfb;
                10'd624:
                    r_pixel_data <= 24'hfff9ff;
                10'd625:
                    r_pixel_data <= 24'hfffcff;
                10'd626:
                    r_pixel_data <= 24'hd2d2d0;
                10'd627:
                    r_pixel_data <= 24'he0e5e1;
                10'd628:
                    r_pixel_data <= 24'h9aa4a5;
                10'd629:
                    r_pixel_data <= 24'hf7ffff;
                10'd630:
                    r_pixel_data <= 24'hc2def4;
                10'd631:
                    r_pixel_data <= 24'hc6e1f6;
                10'd632:
                    r_pixel_data <= 24'hcbdff7;
                10'd633:
                    r_pixel_data <= 24'hd4e6fc;
                10'd634:
                    r_pixel_data <= 24'hcfe6f8;
                10'd635:
                    r_pixel_data <= 24'hc7e2f3;
                10'd636:
                    r_pixel_data <= 24'hccebfd;
                10'd637:
                    r_pixel_data <= 24'hcaebfc;
                10'd638:
                    r_pixel_data <= 24'hceebfd;
                10'd639:
                    r_pixel_data <= 24'hcfebf9;
                10'd640:
                    r_pixel_data <= 24'hd8f3fe;
                10'd641:
                    r_pixel_data <= 24'hd9ecf2;
                10'd642:
                    r_pixel_data <= 24'hf5fdff;
                10'd643:
                    r_pixel_data <= 24'h695d5f;
                10'd644:
                    r_pixel_data <= 24'h330f13;
                10'd645:
                    r_pixel_data <= 24'h310a0f;
                10'd646:
                    r_pixel_data <= 24'h1d0a0e;
                10'd647:
                    r_pixel_data <= 24'h191315;
                10'd648:
                    r_pixel_data <= 24'h141311;
                10'd649:
                    r_pixel_data <= 24'hc0b09;
                10'd650:
                    r_pixel_data <= 24'h130e14;
                10'd651:
                    r_pixel_data <= 24'h70007;
                10'd652:
                    r_pixel_data <= 24'h70101;
                10'd653:
                    r_pixel_data <= 24'h2b1f21;
                10'd654:
                    r_pixel_data <= 24'h765c69;
                10'd655:
                    r_pixel_data <= 24'h9b7f8d;
                10'd656:
                    r_pixel_data <= 24'hd5c5c8;
                10'd657:
                    r_pixel_data <= 24'hfffafb;
                10'd658:
                    r_pixel_data <= 24'hfcfbff;
                10'd659:
                    r_pixel_data <= 24'hfbffff;
                10'd660:
                    r_pixel_data <= 24'hc4e0f5;
                10'd661:
                    r_pixel_data <= 24'hc9e4f9;
                10'd662:
                    r_pixel_data <= 24'hc5def4;
                10'd663:
                    r_pixel_data <= 24'hc6dff5;
                10'd664:
                    r_pixel_data <= 24'hc7e2f5;
                10'd665:
                    r_pixel_data <= 24'hc7e4f6;
                10'd666:
                    r_pixel_data <= 24'hcae7f7;
                10'd667:
                    r_pixel_data <= 24'hc6e6f5;
                10'd668:
                    r_pixel_data <= 24'hcdedfc;
                10'd669:
                    r_pixel_data <= 24'hcce9f7;
                10'd670:
                    r_pixel_data <= 24'hcee9f4;
                10'd671:
                    r_pixel_data <= 24'hd7eef6;
                10'd672:
                    r_pixel_data <= 24'hdbeaf1;
                10'd673:
                    r_pixel_data <= 24'hf3faff;
                10'd674:
                    r_pixel_data <= 24'he4e2e7;
                10'd675:
                    r_pixel_data <= 24'hc2bdc4;
                10'd676:
                    r_pixel_data <= 24'hf1effa;
                10'd677:
                    r_pixel_data <= 24'hf9f9ff;
                10'd678:
                    r_pixel_data <= 24'hfafbff;
                10'd679:
                    r_pixel_data <= 24'hc0c4c7;
                10'd680:
                    r_pixel_data <= 24'h787d81;
                10'd681:
                    r_pixel_data <= 24'h252429;
                10'd682:
                    r_pixel_data <= 24'h231417;
                10'd683:
                    r_pixel_data <= 24'h39181f;
                10'd684:
                    r_pixel_data <= 24'h440a20;
                10'd685:
                    r_pixel_data <= 24'h4a0a22;
                10'd686:
                    r_pixel_data <= 24'h39000f;
                10'd687:
                    r_pixel_data <= 24'h4a202c;
                10'd688:
                    r_pixel_data <= 24'h5d4552;
                10'd689:
                    r_pixel_data <= 24'h4b3b46;
                10'd690:
                    r_pixel_data <= 24'hc2def4;
                10'd691:
                    r_pixel_data <= 24'hc1ddf3;
                10'd692:
                    r_pixel_data <= 24'hc7e3f9;
                10'd693:
                    r_pixel_data <= 24'hc0dff4;
                10'd694:
                    r_pixel_data <= 24'hc7e3f8;
                10'd695:
                    r_pixel_data <= 24'hc5e1f6;
                10'd696:
                    r_pixel_data <= 24'hcde8fb;
                10'd697:
                    r_pixel_data <= 24'hcae7f7;
                10'd698:
                    r_pixel_data <= 24'hc9e9f8;
                10'd699:
                    r_pixel_data <= 24'hcae7f5;
                10'd700:
                    r_pixel_data <= 24'hd1edf9;
                10'd701:
                    r_pixel_data <= 24'hd1e9f5;
                10'd702:
                    r_pixel_data <= 24'hddf1fc;
                10'd703:
                    r_pixel_data <= 24'hdeeefb;
                10'd704:
                    r_pixel_data <= 24'he0f1fb;
                10'd705:
                    r_pixel_data <= 24'he9f7ff;
                10'd706:
                    r_pixel_data <= 24'heaf4ff;
                10'd707:
                    r_pixel_data <= 24'hebf3ff;
                10'd708:
                    r_pixel_data <= 24'hecf3fd;
                10'd709:
                    r_pixel_data <= 24'hf5fcff;
                10'd710:
                    r_pixel_data <= 24'hf5ffff;
                10'd711:
                    r_pixel_data <= 24'hfbffff;
                10'd712:
                    r_pixel_data <= 24'hfcf0f2;
                10'd713:
                    r_pixel_data <= 24'hccabb2;
                10'd714:
                    r_pixel_data <= 24'hb07b8d;
                10'd715:
                    r_pixel_data <= 24'h8d4f64;
                10'd716:
                    r_pixel_data <= 24'h6c3342;
                10'd717:
                    r_pixel_data <= 24'h9b6f7c;
                10'd718:
                    r_pixel_data <= 24'h6f535f;
                10'd719:
                    r_pixel_data <= 24'h190812;
                10'd720:
                    r_pixel_data <= 24'hc4dcf6;
                10'd721:
                    r_pixel_data <= 24'hc4def7;
                10'd722:
                    r_pixel_data <= 24'hc1dff7;
                10'd723:
                    r_pixel_data <= 24'hc1dff7;
                10'd724:
                    r_pixel_data <= 24'hc3dff7;
                10'd725:
                    r_pixel_data <= 24'hc6e0f9;
                10'd726:
                    r_pixel_data <= 24'hc9e1f9;
                10'd727:
                    r_pixel_data <= 24'hcae5fa;
                10'd728:
                    r_pixel_data <= 24'hc7e7f6;
                10'd729:
                    r_pixel_data <= 24'hcaeaf9;
                10'd730:
                    r_pixel_data <= 24'hcfe9f8;
                10'd731:
                    r_pixel_data <= 24'hd3e8f9;
                10'd732:
                    r_pixel_data <= 24'hd8e9fd;
                10'd733:
                    r_pixel_data <= 24'hdaebff;
                10'd734:
                    r_pixel_data <= 24'hd8edff;
                10'd735:
                    r_pixel_data <= 24'hdaf1ff;
                10'd736:
                    r_pixel_data <= 24'hdff0ff;
                10'd737:
                    r_pixel_data <= 24'he4f2ff;
                10'd738:
                    r_pixel_data <= 24'he7f4fd;
                10'd739:
                    r_pixel_data <= 24'he8f5fd;
                10'd740:
                    r_pixel_data <= 24'he9f8ff;
                10'd741:
                    r_pixel_data <= 24'hedf8fc;
                10'd742:
                    r_pixel_data <= 24'hf9f7f8;
                10'd743:
                    r_pixel_data <= 24'hfff8f9;
                10'd744:
                    r_pixel_data <= 24'hfff9ff;
                10'd745:
                    r_pixel_data <= 24'hfff8fe;
                10'd746:
                    r_pixel_data <= 24'hfff9fd;
                10'd747:
                    r_pixel_data <= 24'hfff9fc;
                10'd748:
                    r_pixel_data <= 24'he9e0e5;
                10'd749:
                    r_pixel_data <= 24'hc7c0c7;
                10'd750:
                    r_pixel_data <= 24'hc2dcf7;
                10'd751:
                    r_pixel_data <= 24'hc2ddf8;
                10'd752:
                    r_pixel_data <= 24'hc0def8;
                10'd753:
                    r_pixel_data <= 24'hc1dff9;
                10'd754:
                    r_pixel_data <= 24'hc3def9;
                10'd755:
                    r_pixel_data <= 24'hc5dffa;
                10'd756:
                    r_pixel_data <= 24'hc8e0fa;
                10'd757:
                    r_pixel_data <= 24'hc9e4f9;
                10'd758:
                    r_pixel_data <= 24'hc5e6f7;
                10'd759:
                    r_pixel_data <= 24'hc8e9f8;
                10'd760:
                    r_pixel_data <= 24'hcce9f9;
                10'd761:
                    r_pixel_data <= 24'hd1e8fa;
                10'd762:
                    r_pixel_data <= 24'hd6e8fe;
                10'd763:
                    r_pixel_data <= 24'hd8eaff;
                10'd764:
                    r_pixel_data <= 24'hd4edff;
                10'd765:
                    r_pixel_data <= 24'hd7f0ff;
                10'd766:
                    r_pixel_data <= 24'hdcf2ff;
                10'd767:
                    r_pixel_data <= 24'he0f4ff;
                10'd768:
                    r_pixel_data <= 24'he3f4fe;
                10'd769:
                    r_pixel_data <= 24'he4f5fd;
                10'd770:
                    r_pixel_data <= 24'he6f7ff;
                10'd771:
                    r_pixel_data <= 24'heaf7fd;
                10'd772:
                    r_pixel_data <= 24'hf1f6f9;
                10'd773:
                    r_pixel_data <= 24'hf6f7f9;
                10'd774:
                    r_pixel_data <= 24'hf3f7f8;
                10'd775:
                    r_pixel_data <= 24'hf2f6f7;
                10'd776:
                    r_pixel_data <= 24'hf8f8f6;
                10'd777:
                    r_pixel_data <= 24'hfcfcfa;
                10'd778:
                    r_pixel_data <= 24'hfdfdfd;
                10'd779:
                    r_pixel_data <= 24'hfdfeff;
                10'd780:
                    r_pixel_data <= 24'hc0dcf4;
                10'd781:
                    r_pixel_data <= 24'hc1ddf5;
                10'd782:
                    r_pixel_data <= 24'hbfddf7;
                10'd783:
                    r_pixel_data <= 24'hc2ddf8;
                10'd784:
                    r_pixel_data <= 24'hc3dcfa;
                10'd785:
                    r_pixel_data <= 24'hc4def9;
                10'd786:
                    r_pixel_data <= 24'hc5e1f9;
                10'd787:
                    r_pixel_data <= 24'hc5e4f9;
                10'd788:
                    r_pixel_data <= 24'hc2e5f8;
                10'd789:
                    r_pixel_data <= 24'hc3e9f6;
                10'd790:
                    r_pixel_data <= 24'hc7e8f7;
                10'd791:
                    r_pixel_data <= 24'hcce9f7;
                10'd792:
                    r_pixel_data <= 24'hd0eaf9;
                10'd793:
                    r_pixel_data <= 24'hd3eafa;
                10'd794:
                    r_pixel_data <= 24'hd3edfc;
                10'd795:
                    r_pixel_data <= 24'hd8effd;
                10'd796:
                    r_pixel_data <= 24'hdaf2fe;
                10'd797:
                    r_pixel_data <= 24'hddf3fe;
                10'd798:
                    r_pixel_data <= 24'he1f3fd;
                10'd799:
                    r_pixel_data <= 24'he4f5ff;
                10'd800:
                    r_pixel_data <= 24'he6f7ff;
                10'd801:
                    r_pixel_data <= 24'heaf7ff;
                10'd802:
                    r_pixel_data <= 24'hedf6fd;
                10'd803:
                    r_pixel_data <= 24'hf1f6fc;
                10'd804:
                    r_pixel_data <= 24'hf4f9ff;
                10'd805:
                    r_pixel_data <= 24'hf7faff;
                10'd806:
                    r_pixel_data <= 24'hfbfbfd;
                10'd807:
                    r_pixel_data <= 24'hf8f8f8;
                10'd808:
                    r_pixel_data <= 24'hf8faf9;
                10'd809:
                    r_pixel_data <= 24'hfcfefd;
                10'd810:
                    r_pixel_data <= 24'hbfdaf5;
                10'd811:
                    r_pixel_data <= 24'hc0dbf6;
                10'd812:
                    r_pixel_data <= 24'hc1dcf7;
                10'd813:
                    r_pixel_data <= 24'hc1dcf9;
                10'd814:
                    r_pixel_data <= 24'hc1dcf9;
                10'd815:
                    r_pixel_data <= 24'hc2ddfa;
                10'd816:
                    r_pixel_data <= 24'hc2e0fa;
                10'd817:
                    r_pixel_data <= 24'hc2e2f9;
                10'd818:
                    r_pixel_data <= 24'hc1e4f8;
                10'd819:
                    r_pixel_data <= 24'hc3e6f9;
                10'd820:
                    r_pixel_data <= 24'hc6e7f8;
                10'd821:
                    r_pixel_data <= 24'hc7e8f7;
                10'd822:
                    r_pixel_data <= 24'hcaeaf7;
                10'd823:
                    r_pixel_data <= 24'hceecf7;
                10'd824:
                    r_pixel_data <= 24'hd0ecf8;
                10'd825:
                    r_pixel_data <= 24'hd4effa;
                10'd826:
                    r_pixel_data <= 24'hd7f2fb;
                10'd827:
                    r_pixel_data <= 24'hdbf4fb;
                10'd828:
                    r_pixel_data <= 24'he0f2fc;
                10'd829:
                    r_pixel_data <= 24'he3f4fe;
                10'd830:
                    r_pixel_data <= 24'he8f6ff;
                10'd831:
                    r_pixel_data <= 24'he9f7ff;
                10'd832:
                    r_pixel_data <= 24'hebf8ff;
                10'd833:
                    r_pixel_data <= 24'heff9ff;
                10'd834:
                    r_pixel_data <= 24'heef5fd;
                10'd835:
                    r_pixel_data <= 24'hf3f8fe;
                10'd836:
                    r_pixel_data <= 24'hf8fcff;
                10'd837:
                    r_pixel_data <= 24'hf9fdfe;
                10'd838:
                    r_pixel_data <= 24'hf5fbfb;
                10'd839:
                    r_pixel_data <= 24'hf5fbf9;
                10'd840:
                    r_pixel_data <= 24'hc0d7f6;
                10'd841:
                    r_pixel_data <= 24'hc1d8f7;
                10'd842:
                    r_pixel_data <= 24'hc1daf8;
                10'd843:
                    r_pixel_data <= 24'hc0dbf9;
                10'd844:
                    r_pixel_data <= 24'hbedbf9;
                10'd845:
                    r_pixel_data <= 24'hbeddfa;
                10'd846:
                    r_pixel_data <= 24'hbfdefb;
                10'd847:
                    r_pixel_data <= 24'hc2e0fc;
                10'd848:
                    r_pixel_data <= 24'hc4dffa;
                10'd849:
                    r_pixel_data <= 24'hc6e2fa;
                10'd850:
                    r_pixel_data <= 24'hc8e4fa;
                10'd851:
                    r_pixel_data <= 24'hc9e6f8;
                10'd852:
                    r_pixel_data <= 24'hc9e9f8;
                10'd853:
                    r_pixel_data <= 24'hcaecf6;
                10'd854:
                    r_pixel_data <= 24'hccecf7;
                10'd855:
                    r_pixel_data <= 24'hd1eff9;
                10'd856:
                    r_pixel_data <= 24'hd3f1f9;
                10'd857:
                    r_pixel_data <= 24'hdaf2fc;
                10'd858:
                    r_pixel_data <= 24'he0f2fe;
                10'd859:
                    r_pixel_data <= 24'he4f2ff;
                10'd860:
                    r_pixel_data <= 24'he7f3ff;
                10'd861:
                    r_pixel_data <= 24'he7f5ff;
                10'd862:
                    r_pixel_data <= 24'he8f9ff;
                10'd863:
                    r_pixel_data <= 24'hebfcff;
                10'd864:
                    r_pixel_data <= 24'hf0f9ff;
                10'd865:
                    r_pixel_data <= 24'heef5fb;
                10'd866:
                    r_pixel_data <= 24'hf1f6fc;
                10'd867:
                    r_pixel_data <= 24'hf2fafd;
                10'd868:
                    r_pixel_data <= 24'hf3fdfc;
                10'd869:
                    r_pixel_data <= 24'hf3fffd;
                10'd870:
                    r_pixel_data <= 24'hc1d5f6;
                10'd871:
                    r_pixel_data <= 24'hc0d7f7;
                10'd872:
                    r_pixel_data <= 24'hc0d9f8;
                10'd873:
                    r_pixel_data <= 24'hc0dbf9;
                10'd874:
                    r_pixel_data <= 24'hbddcfb;
                10'd875:
                    r_pixel_data <= 24'hbcddfc;
                10'd876:
                    r_pixel_data <= 24'hbfdefd;
                10'd877:
                    r_pixel_data <= 24'hc0ddfb;
                10'd878:
                    r_pixel_data <= 24'hc5defc;
                10'd879:
                    r_pixel_data <= 24'hc8e0fc;
                10'd880:
                    r_pixel_data <= 24'hc8e2fb;
                10'd881:
                    r_pixel_data <= 24'hc8e4f9;
                10'd882:
                    r_pixel_data <= 24'hc7e8f7;
                10'd883:
                    r_pixel_data <= 24'hc7ecf5;
                10'd884:
                    r_pixel_data <= 24'hcaecf5;
                10'd885:
                    r_pixel_data <= 24'hcdeff8;
                10'd886:
                    r_pixel_data <= 24'hd1f2f9;
                10'd887:
                    r_pixel_data <= 24'hd7f2fb;
                10'd888:
                    r_pixel_data <= 24'he0f0fd;
                10'd889:
                    r_pixel_data <= 24'he3effd;
                10'd890:
                    r_pixel_data <= 24'he5f1fd;
                10'd891:
                    r_pixel_data <= 24'he5f3fe;
                10'd892:
                    r_pixel_data <= 24'he4f8ff;
                10'd893:
                    r_pixel_data <= 24'he8fbff;
                10'd894:
                    r_pixel_data <= 24'hf0faff;
                10'd895:
                    r_pixel_data <= 24'hf2f9ff;
                10'd896:
                    r_pixel_data <= 24'hf2f9ff;
                10'd897:
                    r_pixel_data <= 24'hf1fbfd;
                10'd898:
                    r_pixel_data <= 24'hf1fdfd;
                10'd899:
                    r_pixel_data <= 24'hf1fffd;
                default: 
                    r_pixel_data <= 24'h000000;
            endcase
        end
    end

endmodule //lcd_rom
