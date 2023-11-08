project "FREETYPE"
	location "FREETYPE"
	kind "StaticLib"
	language "C"
	staticruntime "On"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	includedirs {

		"FREETYPE/include"
	}

	defines {

		"FT2_BUILD_LIBRARY"
	}

	files {

		"FREETYPE/include/ft2build.h",
		"FREETYPE/include/freetype/*.h",
		"FREETYPE/include/freetype/config/*.h",
		"FREETYPE/include/freetype/internal/*.h",

		"FREETYPE/src/autofit/autofit.c",
		"FREETYPE/src/base/ftbase.c",
		"FREETYPE/src/base/ftbbox.c",
		"FREETYPE/src/base/ftbdf.c",
		"FREETYPE/src/base/ftbitmap.c",
		"FREETYPE/src/base/ftcid.c",
		"FREETYPE/src/base/ftdebug.c",
		"FREETYPE/src/base/ftfstype.c",
		"FREETYPE/src/base/ftgasp.c",
		"FREETYPE/src/base/ftglyph.c",
		"FREETYPE/src/base/ftgxval.c",
		"FREETYPE/src/base/ftinit.c",
		"FREETYPE/src/base/ftmm.c",
		"FREETYPE/src/base/ftotval.c",
		"FREETYPE/src/base/ftpatent.c",
		"FREETYPE/src/base/ftpfr.c",
		"FREETYPE/src/base/ftstroke.c",
		"FREETYPE/src/base/ftsynth.c",
		"FREETYPE/src/base/ftsystem.c",
		"FREETYPE/src/base/fttype1.c",
		"FREETYPE/src/base/ftwinfnt.c",
		"FREETYPE/src/bdf/bdf.c",
		"FREETYPE/src/bzip2/ftbzip2.c",
		"FREETYPE/src/cache/ftcache.c",
		"FREETYPE/src/cff/cff.c",
		"FREETYPE/src/cid/type1cid.c",
		"FREETYPE/src/gzip/ftgzip.c",
		"FREETYPE/src/lzw/ftlzw.c",
		"FREETYPE/src/pcf/pcf.c",
		"FREETYPE/src/pfr/pfr.c",
		"FREETYPE/src/psaux/psaux.c",
		"FREETYPE/src/pshinter/pshinter.c",
		"FREETYPE/src/psnames/psnames.c",
		"FREETYPE/src/raster/raster.c",
		"FREETYPE/src/sdf/sdf.c",
		"FREETYPE/src/sfnt/sfnt.c",
		"FREETYPE/src/smooth/smooth.c",
		"FREETYPE/src/truetype/truetype.c",
		"FREETYPE/src/type1/type1.c",
		"FREETYPE/src/type42/type42.c",
		"FREETYPE/src/winfonts/winfnt.c",
		"FREETYPE/src/svg/ftsvg.c",
		"FREETYPE/src/svg/svg.c"
	}

	disablewarnings { "4267", "4244" }

	filter "system:windows"
		systemversion "latest"

		defines {

			"_CRT_SECURE_NO_WARNINGS",
			"_CRT_NONSTDC_NO_WARNINGS",
		}

	filter "system:macosx"

		sysincludedirs {

			"FREETYPE/include"
		}

		externalincludedirs {

			"FREETYPE/include"
		}

	filter "configurations:Debug"
		defines "VE_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "VE_RELEASE"
		runtime "Release"
		symbols "On"
		optimize "On"

	filter "configurations:Dist"
		defines "VE_DIST"
		runtime "Release"
		optimize "On"

project "MSDFGEN"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "On"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	includedirs {

		"include",
		"FREETYPE/include"
	}

	links {

		"FREETYPE"
	}

	defines {

		"MSDFGEN_USE_CPP11"
	}

	files {

		"core/**.h",
		"core/**.hpp",
		"core/**.cpp",
		"ext/**.h",
		"ext/**.hpp",
		"ext/**.cpp",
		"lib/**.cpp",
		"include/**.h"
	}

	disablewarnings { "4267", "4244" }

	filter "system:windows"
		systemversion "latest"

	filter "system:macosx"

		sysincludedirs {

			"include",
			"FREETYPE/include"
		}

		externalincludedirs {

			"include",
			"FREETYPE/include"
		}

	filter "configurations:Debug"
		defines "VE_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "VE_RELEASE"
		runtime "Release"
		symbols "On"
		optimize "On"

	filter "configurations:Dist"
		defines "VE_DIST"
		runtime "Release"
		optimize "On"
