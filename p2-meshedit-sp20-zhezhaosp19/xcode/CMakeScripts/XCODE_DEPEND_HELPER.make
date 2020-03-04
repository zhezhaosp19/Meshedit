# DO NOT EDIT
# This makefile makes sure all linkable targets are
# up-to-date with anything they link to
default:
	echo "Do not invoke directly"

# Rules to remove targets that are older than anything to which they
# link.  This forces Xcode to relink the targets from scratch.  It
# does not seem to check these dependencies itself.
PostBuild.CGL.Debug:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/src/Debug/libCGL.a:
	/bin/rm -f /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/src/Debug/libCGL.a


PostBuild.glew.Debug:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glew/Debug/libglew.a:
	/bin/rm -f /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glew/Debug/libglew.a


PostBuild.glfw.Debug:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glfw/src/Debug/libglfw3.a:
	/bin/rm -f /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glfw/src/Debug/libglfw3.a


PostBuild.meshedit.Debug:
PostBuild.CGL.Debug: /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/Debug/meshedit
PostBuild.glew.Debug: /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/Debug/meshedit
PostBuild.glfw.Debug: /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/Debug/meshedit
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/Debug/meshedit:\
	/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/src/Debug/libCGL.a\
	/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glew/Debug/libglew.a\
	/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glfw/src/Debug/libglfw3.a\
	/usr/local/lib/libfreetype.dylib\
	/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/src/dirent/glut32.lib\
	/usr/local/lib/libfreetype.dylib
	/bin/rm -f /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/Debug/meshedit


PostBuild.CGL.Release:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/src/Release/libCGL.a:
	/bin/rm -f /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/src/Release/libCGL.a


PostBuild.glew.Release:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glew/Release/libglew.a:
	/bin/rm -f /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glew/Release/libglew.a


PostBuild.glfw.Release:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glfw/src/Release/libglfw3.a:
	/bin/rm -f /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glfw/src/Release/libglfw3.a


PostBuild.meshedit.Release:
PostBuild.CGL.Release: /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/Release/meshedit
PostBuild.glew.Release: /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/Release/meshedit
PostBuild.glfw.Release: /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/Release/meshedit
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/Release/meshedit:\
	/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/src/Release/libCGL.a\
	/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glew/Release/libglew.a\
	/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glfw/src/Release/libglfw3.a\
	/usr/local/lib/libfreetype.dylib\
	/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/src/dirent/glut32.lib\
	/usr/local/lib/libfreetype.dylib
	/bin/rm -f /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/Release/meshedit


PostBuild.CGL.MinSizeRel:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/src/MinSizeRel/libCGL.a:
	/bin/rm -f /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/src/MinSizeRel/libCGL.a


PostBuild.glew.MinSizeRel:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glew/MinSizeRel/libglew.a:
	/bin/rm -f /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glew/MinSizeRel/libglew.a


PostBuild.glfw.MinSizeRel:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glfw/src/MinSizeRel/libglfw3.a:
	/bin/rm -f /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glfw/src/MinSizeRel/libglfw3.a


PostBuild.meshedit.MinSizeRel:
PostBuild.CGL.MinSizeRel: /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/MinSizeRel/meshedit
PostBuild.glew.MinSizeRel: /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/MinSizeRel/meshedit
PostBuild.glfw.MinSizeRel: /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/MinSizeRel/meshedit
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/MinSizeRel/meshedit:\
	/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/src/MinSizeRel/libCGL.a\
	/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glew/MinSizeRel/libglew.a\
	/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glfw/src/MinSizeRel/libglfw3.a\
	/usr/local/lib/libfreetype.dylib\
	/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/src/dirent/glut32.lib\
	/usr/local/lib/libfreetype.dylib
	/bin/rm -f /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/MinSizeRel/meshedit


PostBuild.CGL.RelWithDebInfo:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/src/RelWithDebInfo/libCGL.a:
	/bin/rm -f /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/src/RelWithDebInfo/libCGL.a


PostBuild.glew.RelWithDebInfo:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glew/RelWithDebInfo/libglew.a:
	/bin/rm -f /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glew/RelWithDebInfo/libglew.a


PostBuild.glfw.RelWithDebInfo:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glfw/src/RelWithDebInfo/libglfw3.a:
	/bin/rm -f /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glfw/src/RelWithDebInfo/libglfw3.a


PostBuild.meshedit.RelWithDebInfo:
PostBuild.CGL.RelWithDebInfo: /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/RelWithDebInfo/meshedit
PostBuild.glew.RelWithDebInfo: /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/RelWithDebInfo/meshedit
PostBuild.glfw.RelWithDebInfo: /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/RelWithDebInfo/meshedit
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/RelWithDebInfo/meshedit:\
	/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/src/RelWithDebInfo/libCGL.a\
	/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glew/RelWithDebInfo/libglew.a\
	/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glfw/src/RelWithDebInfo/libglfw3.a\
	/usr/local/lib/libfreetype.dylib\
	/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/src/dirent/glut32.lib\
	/usr/local/lib/libfreetype.dylib
	/bin/rm -f /Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/RelWithDebInfo/meshedit




# For each target create a dummy ruleso the target does not have to exist
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/src/dirent/glut32.lib:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glew/Debug/libglew.a:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glew/MinSizeRel/libglew.a:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glew/RelWithDebInfo/libglew.a:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glew/Release/libglew.a:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glfw/src/Debug/libglfw3.a:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glfw/src/MinSizeRel/libglfw3.a:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glfw/src/RelWithDebInfo/libglfw3.a:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/deps/glfw/src/Release/libglfw3.a:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/src/Debug/libCGL.a:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/src/MinSizeRel/libCGL.a:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/src/RelWithDebInfo/libCGL.a:
/Users/Emma/Documents/UCB/cs284/p2-meshedit-sp20-zhezhaosp19/xcode/CGL/src/Release/libCGL.a:
/usr/local/lib/libfreetype.dylib:
