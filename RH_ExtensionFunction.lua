-- �A�����Ԃɂ��g���֐����C�u����
-- �g�p���@�F
-- �X�N���v�g�̏��߂�
-- local EF = require("RH_ExtensionFunction")
-- �ƋL�q (EF�͉��ł��悢�j
-- EF.split(str, dlim), EF.sign(num) �̂悤�Ɏg��

require("rikky_module")

-- �����֐�
local function sign(num)
	local sgn
	if num < 0 then
		sgn = -1
	elseif num == 0 then
		sgn = 0
	else
		sgn = 1
	end

	return sgn
end

-- 0�����؎̂Ċ֐�
local function floor(num, keta)
	local sgn = sign(num)
	num = math.abs(num)
	if type(tonumber(keta)) == "number" then
		num = math.floor(num * 10^keta) * 10^(-keta)
	else
		num = math.floor(num)
	end
	num = sgn * num
	
	return num
end

-- 0�����l�̌ܓ��֐�
local function round(num, keta)
	local sgn = sign(num)
	num = math.abs(num)
	if type(tonumber(keta)) == "number" then
		num = math.floor(num * 10^keta + 0.5) * 10^(-keta)
	else
		num = math.floor(num + 0.5)
	end
	num = sgn * num
	
	return num
end

-- ������X�v���b�g�֐�
local function split(str, delim)
    if string.find(str, delim) == nil then
        return { str }
    end

    local result = {}
    local pat = "(.-)" .. delim .. "()"
    local lastPos
    for part, pos in string.gmatch(str, pat) do 
        table.insert(result, part)
        lastPos = pos
    end
    table.insert(result, string.sub(str, lastPos))
	
    return result
end

-- "number"�܂���"string"����^�ϊ��֐���Ԃ��֐�
local function totype(typ)
	if typ == "number" then
		return tonumber
	elseif typ == "string" then
		return tostring
	else
		return function(v) return v end
	end
end

-- �^��number�^�܂���string�^�ɕύX����֐�
-- �A�z�z���z����z��ł��\
local function change_type(val, typ)
	local totype = totype(typ)
	
	local function _change_type(val)
		if type(val) ~= "table" then
			return totype(val)
		else
			local tbl = {}
			for i, v in ipairs(val) do
				table.insert(tbl, _change_type(val))
			end
			for k, v in pairs(val) do
				tbl[k] = _change_type(val)
			end
			
			return tbl
		end
	end
	
	return _change_type(val)
end

-- �t�@�C����s���ǂݍ��ݔz��ɃZ�b�g����֐�
-- delim �ɕ���������Ƃ��̕����ŃX�v���b�g����
-- option ��true�̂Ƃ��z��̒��ɔz��������A�X�v���b�g��������������
local function read_file(adress, delim, option)
	local tbl = {}
	local f = io.open(adress, "r")
	local i = 1
	
	for line in f:lines() do
		
		if delim then
			local tmp = split(line, delim)
			
			if option then
				tbl[i] = tmp
			else
				for j, v in ipairs(tmp) do
					table.insert(tbl, v)
				end
			end
		else
			table.insert(tbl, line)
		end
		
		i = i + 1
	end
	
	f:close()
	
	return tbl
end

local function write_file(tbl, adress, delim, option)
end

-- �t�@�C����s���ǂݍ��ݘA�z�z��ɃZ�b�g����֐�
-- delim �̕����ŃX�v���b�g����
-- �t�@�C���̈�s�ڂ͑����l���L�[�ƂȂ�
local function read_file_hash(adress, delim)
	local i = 1
	local key = {}
	local tbl = {}
	local f = io.open(adress, "r")
	
	for line in f:lines() do
	
		if(i == 1) then
			key = split(line, delim)
		else
			local tmp = split(line, delim)
			tbl[i-1] = {}
			for j, v in ipairs(key) do
				tbl[i-1][v] = tmp[j]
			end
		end	

		i = i + 1	
	end

	f:close()
	tbl.attribute_key = key
	
	return tbl
end

local function write_file_hash(tbl_rel, adress, option)
	local f = io.open(adress,"w")
	local key = tbl_rel.attribute_key
	
	for j, w in ipairs(key) do
		if j ~= #key then
			w = w .. ","
		end
		
		f:write(w)
	end
	
	f:write("\n")
	
	for i, v in ipairs(tbl_rel) do
	
		for j, w in ipairs(key) do
			local x = v[w] or ""
			if j ~= #key then
				x = x .. ","
			end
			
			f:write(x)
		end
	
		f:write("\n")
	end
	
	f:close()

	return 0
end

-- �t�H���_�[�̒��ɓ����Ă��邷�ׂăt�@�C���̃t�@�C�������e�[�u���ŕԂ��֐�
-- option��ture�̂Ƃ�path�̓t�@�C���p�X�A�l�Ȃ���false�ł�path�̓t�H���_�p�X
-- local function folder_file(path, option)
	-- local ftbl = {}
	-- if option then
		-- path = string.match(f1, "(.+\\).-%.%w+$")
	-- end
			-- local exta = rikky_module.getinfo("input")
		-- local tmp = rikky_module.dir(fold, "*all")
		
		-- for i, v in ipairs(tmp) do
			-- for j, w in ipairs(exta) do
				-- if string.find(v, w .. "$") and (str == "" or string.find(string.match(v, ".+\\(.-)$"), str)) then
					-- table.insert(ftbl, v)
				-- end
			-- end
		-- end
	-- return ftbl
-- end


return {
	sign		= sign,
	floor		= floor,
	round		= round,
	split		= split,
	totype		= totype,
	change_type	= change_type,
	read_file	= read_file,
	write_file	= write_file,
	read_file_hash	= read_file_hash,
	write_file_hash	= write_file_hash,
	-- folder_file	= folder_file,
}