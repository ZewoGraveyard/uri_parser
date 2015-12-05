TARGET = uri_parser
PKG_NAME = uri-parser

all: $(TARGET)

$(TARGET): *.c
	 clang -c *.c
	 ar -rcs lib$(TARGET).a *.o
	 rm *.o
	 mkdir -p $(TARGET)/DEBIAN
	 mkdir -p $(TARGET)/usr/local/lib
	 mkdir -p $(TARGET)/usr/local/include/$(TARGET)
	 cp *.h $(TARGET)/usr/local/include/$(TARGET)
	 cp lib$(TARGET).a $(TARGET)/usr/local/lib/
	 touch $(TARGET)/DEBIAN/control
	 echo "Package: $(PKG_NAME)" >> $(TARGET)/DEBIAN/control
	 echo "Version: 1.0" >> $(TARGET)/DEBIAN/control
	 echo "Section: custom" >> $(TARGET)/DEBIAN/control
	 echo "Priority: optional" >> $(TARGET)/DEBIAN/control
	 echo "Architecture: all" >> $(TARGET)/DEBIAN/control
	 echo "Essential: no" >> $(TARGET)/DEBIAN/control
	 echo "Installed-Size: 1024" >> $(TARGET)/DEBIAN/control
	 echo "Maintainer: zewo.io" >> $(TARGET)/DEBIAN/control
	 echo "Description: $(TARGET)" >> $(TARGET)/DEBIAN/control
	 dpkg-deb --build $(TARGET)
	 rm -rf lib$(TARGET).a
	 rm -rf $(TARGET)
