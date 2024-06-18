# Suggestion to ease the compilation process of the
# drivers against each Lua version.
# For it to work, you have to install other versions of Lua in diferent
# paths.
#
# Suppose you have a 'gsoc' folder containing a folder for each Lua version
# (gsoc/lua-5.1.5, gsoc/lua-5.2.4 and so on) and another folder for LuaSQL
# (gsoc/luasql).
# This file should be in 'gsoc/luasql' folder so it could refer to any Lua
# version using '../lua-5.X.X'
#

#echo
#echo == Lua 5.0 ==
#../lua-5.0.3/bin/lua test.lua sqlite3 luasql_test

echo
echo == Lua 5.1 ==
make clean sqlite3 LUA_INC=../lua-5.1.5/src/ LUA_SYS_VER=5.1
sudo make LUA_SYS_VER=5.1 PREFIX=/usr/local install
ls -l /usr/local/lib/lua/5.1/luasql
cd tests
../../lua-5.1.5/src/lua -e "package.cpath='./?.so;'..package.cpath; pg=require'luasql.sqlite3'" test.lua sqlite3 luasql_test
cd ..

echo
echo == Lua 5.2 ==
make clean sqlite3 LUA_INC=../lua-5.2.4/src/ LUA_SYS_VER=5.2
sudo make LUA_SYS_VER=5.2 PREFIX=/usr/local install
ls -l /usr/local/lib/lua/5.2/luasql
cd tests
../../lua-5.2.4/src/lua -e "package.cpath='./?.so;'..package.cpath; pg=require'luasql.sqlite3'" test.lua sqlite3 luasql_test
cd ..

echo
echo == Lua 5.3 ==
make clean sqlite3 LUA_INC=../lua-5.3.5/src/ LUA_SYS_VER=5.3
sudo make LUA_SYS_VER=5.3 PREFIX=/usr/local install
ls -l /usr/local/lib/lua/5.3/luasql
cd tests
../../lua-5.3.5/bin/lua -e "package.cpath='./?.so;'..package.cpath; pg=require'luasql.sqlite3'" test.lua sqlite3 luasql_test
cd ..

echo
echo == Lua 5.4 ==
make clean sqlite3 LUA_INC=../lua-5.4.1/src/ LUA_SYS_VER=5.4
sudo make LUA_SYS_VER=5.4 PREFIX=/usr/local install
ls -l /usr/local/lib/lua/5.4/luasql
cd tests
../../lua-5.4.1/src/lua -e "package.cpath='./?.so;'..package.cpath; pg=require'luasql.sqlite3'" test.lua sqlite3 luasql_test
cd ..

