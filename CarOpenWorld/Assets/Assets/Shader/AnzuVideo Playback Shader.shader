Shader "Anzu/Video Playback Shader" {
	Properties {
		_ShouldSwitchRB ("Should switch R/B", Float) = 0
		_ShouldFlipX ("Should Flip X", Float) = 0
		_ShouldFlipY ("Should Flip Y", Float) = 0
		_BaseColor ("Base Color (RGB)", Vector) = (1,1,1,1)
		_Brightness ("Brightness", Float) = 0
		_Contrast ("Contrast", Float) = 1
		_VisibleNormWidth ("Visible Width", Float) = 1
		_MainTex ("Base (RGB)", 2D) = "black" {}
	}
	SubShader {
		Pass {
			GpuProgramID 43471
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	int _ShouldSwitchRB;
					uniform 	int _ShouldFlipX;
					uniform 	int _ShouldFlipY;
					uniform 	vec4 _BaseColor;
					uniform 	float _Brightness;
					uniform 	float _Contrast;
					uniform 	float _VisibleNormWidth;
					uniform 	vec4 _MainTex_TexelSize;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					bvec3 u_xlatb0;
					float u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlatb0.x = 8.0>=_MainTex_TexelSize.z;
					    if(u_xlatb0.x){
					        SV_Target0 = _BaseColor;
					        return;
					    }
					    u_xlatb0.xyz = equal(ivec4(_ShouldFlipX, _ShouldFlipY, _ShouldSwitchRB, _ShouldFlipX), ivec4(1, 1, 1, 0)).xyz;
					    u_xlat16_1.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
					    u_xlat9 = u_xlat16_1.x * _VisibleNormWidth;
					    u_xlat1 = vs_TEXCOORD0.x * _VisibleNormWidth;
					    u_xlat2.x = (u_xlatb0.x) ? u_xlat9 : u_xlat1;
					    u_xlat2.y = (u_xlatb0.y) ? u_xlat16_1.y : vs_TEXCOORD0.y;
					    u_xlat10_0.xyw = texture2D(_MainTex, u_xlat2.xy).xyz;
					    u_xlat16_0.xyw = u_xlat10_0.xyw + vec3(-0.5, -0.5, -0.5);
					    u_xlat1 = max(_Contrast, 0.0);
					    u_xlat0.xyw = u_xlat16_0.xyw * vec3(u_xlat1) + vec3(_Brightness);
					    u_xlat0.xyw = u_xlat0.xyw + vec3(0.5, 0.5, 0.5);
					    if(u_xlatb0.z){
					        SV_Target0.xyz = u_xlat0.wyx;
					        SV_Target0.w = 1.0;
					        return;
					    } else {
					        SV_Target0.xyz = u_xlat0.xyw;
					        SV_Target0.w = 1.0;
					        return;
					    }
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	int _ShouldSwitchRB;
					uniform 	int _ShouldFlipX;
					uniform 	int _ShouldFlipY;
					uniform 	vec4 _BaseColor;
					uniform 	float _Brightness;
					uniform 	float _Contrast;
					uniform 	float _VisibleNormWidth;
					uniform 	vec4 _MainTex_TexelSize;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					bvec3 u_xlatb0;
					float u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlatb0.x = 8.0>=_MainTex_TexelSize.z;
					    if(u_xlatb0.x){
					        SV_Target0 = _BaseColor;
					        return;
					    }
					    u_xlatb0.xyz = equal(ivec4(_ShouldFlipX, _ShouldFlipY, _ShouldSwitchRB, _ShouldFlipX), ivec4(1, 1, 1, 0)).xyz;
					    u_xlat16_1.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
					    u_xlat9 = u_xlat16_1.x * _VisibleNormWidth;
					    u_xlat1 = vs_TEXCOORD0.x * _VisibleNormWidth;
					    u_xlat2.x = (u_xlatb0.x) ? u_xlat9 : u_xlat1;
					    u_xlat2.y = (u_xlatb0.y) ? u_xlat16_1.y : vs_TEXCOORD0.y;
					    u_xlat10_0.xyw = texture2D(_MainTex, u_xlat2.xy).xyz;
					    u_xlat16_0.xyw = u_xlat10_0.xyw + vec3(-0.5, -0.5, -0.5);
					    u_xlat1 = max(_Contrast, 0.0);
					    u_xlat0.xyw = u_xlat16_0.xyw * vec3(u_xlat1) + vec3(_Brightness);
					    u_xlat0.xyw = u_xlat0.xyw + vec3(0.5, 0.5, 0.5);
					    if(u_xlatb0.z){
					        SV_Target0.xyz = u_xlat0.wyx;
					        SV_Target0.w = 1.0;
					        return;
					    } else {
					        SV_Target0.xyz = u_xlat0.xyw;
					        SV_Target0.w = 1.0;
					        return;
					    }
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	int _ShouldSwitchRB;
					uniform 	int _ShouldFlipX;
					uniform 	int _ShouldFlipY;
					uniform 	vec4 _BaseColor;
					uniform 	float _Brightness;
					uniform 	float _Contrast;
					uniform 	float _VisibleNormWidth;
					uniform 	vec4 _MainTex_TexelSize;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					bvec3 u_xlatb0;
					float u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlatb0.x = 8.0>=_MainTex_TexelSize.z;
					    if(u_xlatb0.x){
					        SV_Target0 = _BaseColor;
					        return;
					    }
					    u_xlatb0.xyz = equal(ivec4(_ShouldFlipX, _ShouldFlipY, _ShouldSwitchRB, _ShouldFlipX), ivec4(1, 1, 1, 0)).xyz;
					    u_xlat16_1.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
					    u_xlat9 = u_xlat16_1.x * _VisibleNormWidth;
					    u_xlat1 = vs_TEXCOORD0.x * _VisibleNormWidth;
					    u_xlat2.x = (u_xlatb0.x) ? u_xlat9 : u_xlat1;
					    u_xlat2.y = (u_xlatb0.y) ? u_xlat16_1.y : vs_TEXCOORD0.y;
					    u_xlat10_0.xyw = texture2D(_MainTex, u_xlat2.xy).xyz;
					    u_xlat16_0.xyw = u_xlat10_0.xyw + vec3(-0.5, -0.5, -0.5);
					    u_xlat1 = max(_Contrast, 0.0);
					    u_xlat0.xyw = u_xlat16_0.xyw * vec3(u_xlat1) + vec3(_Brightness);
					    u_xlat0.xyw = u_xlat0.xyw + vec3(0.5, 0.5, 0.5);
					    if(u_xlatb0.z){
					        SV_Target0.xyz = u_xlat0.wyx;
					        SV_Target0.w = 1.0;
					        return;
					    } else {
					        SV_Target0.xyz = u_xlat0.xyw;
					        SV_Target0.w = 1.0;
					        return;
					    }
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	int _ShouldSwitchRB;
					uniform 	int _ShouldFlipX;
					uniform 	int _ShouldFlipY;
					uniform 	vec4 _BaseColor;
					uniform 	float _Brightness;
					uniform 	float _Contrast;
					uniform 	float _VisibleNormWidth;
					uniform 	vec4 _MainTex_TexelSize;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					bvec3 u_xlatb0;
					float u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					float u_xlat9;
					void main()
					{
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0.x = !!(8.0>=_MainTex_TexelSize.z);
					#else
					    u_xlatb0.x = 8.0>=_MainTex_TexelSize.z;
					#endif
					    if(u_xlatb0.x){
					        SV_Target0 = _BaseColor;
					        return;
					    }
					    u_xlatb0.xyz = equal(ivec4(_ShouldFlipX, _ShouldFlipY, _ShouldSwitchRB, _ShouldFlipX), ivec4(1, 1, 1, 0)).xyz;
					    u_xlat16_1.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
					    u_xlat9 = u_xlat16_1.x * _VisibleNormWidth;
					    u_xlat1 = vs_TEXCOORD0.x * _VisibleNormWidth;
					    u_xlat2.x = (u_xlatb0.x) ? u_xlat9 : u_xlat1;
					    u_xlat2.y = (u_xlatb0.y) ? u_xlat16_1.y : vs_TEXCOORD0.y;
					    u_xlat16_0.xyw = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat16_0.xyw = u_xlat16_0.xyw + vec3(-0.5, -0.5, -0.5);
					    u_xlat1 = max(_Contrast, 0.0);
					    u_xlat0.xyw = u_xlat16_0.xyw * vec3(u_xlat1) + vec3(_Brightness);
					    u_xlat0.xyw = u_xlat0.xyw + vec3(0.5, 0.5, 0.5);
					    if(u_xlatb0.z){
					        SV_Target0.xyz = u_xlat0.wyx;
					        SV_Target0.w = 1.0;
					        return;
					    } else {
					        SV_Target0.xyz = u_xlat0.xyw;
					        SV_Target0.w = 1.0;
					        return;
					    }
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	int _ShouldSwitchRB;
					uniform 	int _ShouldFlipX;
					uniform 	int _ShouldFlipY;
					uniform 	vec4 _BaseColor;
					uniform 	float _Brightness;
					uniform 	float _Contrast;
					uniform 	float _VisibleNormWidth;
					uniform 	vec4 _MainTex_TexelSize;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					bvec3 u_xlatb0;
					float u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					float u_xlat9;
					void main()
					{
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0.x = !!(8.0>=_MainTex_TexelSize.z);
					#else
					    u_xlatb0.x = 8.0>=_MainTex_TexelSize.z;
					#endif
					    if(u_xlatb0.x){
					        SV_Target0 = _BaseColor;
					        return;
					    }
					    u_xlatb0.xyz = equal(ivec4(_ShouldFlipX, _ShouldFlipY, _ShouldSwitchRB, _ShouldFlipX), ivec4(1, 1, 1, 0)).xyz;
					    u_xlat16_1.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
					    u_xlat9 = u_xlat16_1.x * _VisibleNormWidth;
					    u_xlat1 = vs_TEXCOORD0.x * _VisibleNormWidth;
					    u_xlat2.x = (u_xlatb0.x) ? u_xlat9 : u_xlat1;
					    u_xlat2.y = (u_xlatb0.y) ? u_xlat16_1.y : vs_TEXCOORD0.y;
					    u_xlat16_0.xyw = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat16_0.xyw = u_xlat16_0.xyw + vec3(-0.5, -0.5, -0.5);
					    u_xlat1 = max(_Contrast, 0.0);
					    u_xlat0.xyw = u_xlat16_0.xyw * vec3(u_xlat1) + vec3(_Brightness);
					    u_xlat0.xyw = u_xlat0.xyw + vec3(0.5, 0.5, 0.5);
					    if(u_xlatb0.z){
					        SV_Target0.xyz = u_xlat0.wyx;
					        SV_Target0.w = 1.0;
					        return;
					    } else {
					        SV_Target0.xyz = u_xlat0.xyw;
					        SV_Target0.w = 1.0;
					        return;
					    }
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	int _ShouldSwitchRB;
					uniform 	int _ShouldFlipX;
					uniform 	int _ShouldFlipY;
					uniform 	vec4 _BaseColor;
					uniform 	float _Brightness;
					uniform 	float _Contrast;
					uniform 	float _VisibleNormWidth;
					uniform 	vec4 _MainTex_TexelSize;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					bvec3 u_xlatb0;
					float u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					float u_xlat9;
					void main()
					{
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0.x = !!(8.0>=_MainTex_TexelSize.z);
					#else
					    u_xlatb0.x = 8.0>=_MainTex_TexelSize.z;
					#endif
					    if(u_xlatb0.x){
					        SV_Target0 = _BaseColor;
					        return;
					    }
					    u_xlatb0.xyz = equal(ivec4(_ShouldFlipX, _ShouldFlipY, _ShouldSwitchRB, _ShouldFlipX), ivec4(1, 1, 1, 0)).xyz;
					    u_xlat16_1.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
					    u_xlat9 = u_xlat16_1.x * _VisibleNormWidth;
					    u_xlat1 = vs_TEXCOORD0.x * _VisibleNormWidth;
					    u_xlat2.x = (u_xlatb0.x) ? u_xlat9 : u_xlat1;
					    u_xlat2.y = (u_xlatb0.y) ? u_xlat16_1.y : vs_TEXCOORD0.y;
					    u_xlat16_0.xyw = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat16_0.xyw = u_xlat16_0.xyw + vec3(-0.5, -0.5, -0.5);
					    u_xlat1 = max(_Contrast, 0.0);
					    u_xlat0.xyw = u_xlat16_0.xyw * vec3(u_xlat1) + vec3(_Brightness);
					    u_xlat0.xyw = u_xlat0.xyw + vec3(0.5, 0.5, 0.5);
					    if(u_xlatb0.z){
					        SV_Target0.xyz = u_xlat0.wyx;
					        SV_Target0.w = 1.0;
					        return;
					    } else {
					        SV_Target0.xyz = u_xlat0.xyw;
					        SV_Target0.w = 1.0;
					        return;
					    }
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3"
				}
			}
		}
	}
	Fallback "Diffuse"
}