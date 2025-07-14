Shader "Hidden/BidstackOcclusionTest" {
	Properties {
		_PointsTex ("Texture", 2D) = "white" {}
		_DTSizeInv ("DT Size + Inv", Vector) = (0,0,0,0)
		_DepthScale ("Depth scale", Float) = 1.0001
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 57689
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 _DTSizeInv;
					uniform 	float _DepthScale;
					uniform lowp sampler2D _PointsTex;
					uniform highp sampler2D _CameraDepthTexture;
					varying highp vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat4;
					float u_xlat7;
					float u_xlat9;
					float u_xlat10;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_PointsTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xy = u_xlat10_0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat16_0.xy * _DTSizeInv.xy + vec2(0.5, 0.5);
					    u_xlat1.xy = ceil(u_xlat0.xy);
					    u_xlat1.xy = u_xlat1.xy + vec2(-0.49000001, -0.49000001);
					    u_xlat1.zw = u_xlat1.xy * _DTSizeInv.zw;
					    u_xlat9 = texture2D(_CameraDepthTexture, u_xlat1.zw).x;
					    u_xlat9 = _ZBufferParams.z * u_xlat9 + _ZBufferParams.w;
					    u_xlat9 = float(1.0) / u_xlat9;
					    u_xlat2.xy = floor(u_xlat0.xy);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat2.xy = u_xlat2.xy + vec2(-0.49000001, -0.49000001);
					    u_xlat1.xy = u_xlat2.xy * _DTSizeInv.zw;
					    u_xlat10 = texture2D(_CameraDepthTexture, u_xlat1.xw).x;
					    u_xlat7 = texture2D(_CameraDepthTexture, u_xlat1.zy).x;
					    u_xlat1.x = texture2D(_CameraDepthTexture, u_xlat1.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat4 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
					    u_xlat4 = float(1.0) / u_xlat4;
					    u_xlat4 = (-u_xlat1.x) + u_xlat4;
					    u_xlat1.x = u_xlat0.x * u_xlat4 + u_xlat1.x;
					    u_xlat4 = _ZBufferParams.z * u_xlat10 + _ZBufferParams.w;
					    u_xlat4 = float(1.0) / u_xlat4;
					    u_xlat9 = u_xlat9 + (-u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat9 + u_xlat4;
					    u_xlat0.x = (-u_xlat1.x) + u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * u_xlat0.x + u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * _DepthScale;
					    u_xlatb0 = u_xlat0.x>=u_xlat10_0.z;
					    SV_Target0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(bvec4(u_xlatb0)));
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
					attribute highp vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 _DTSizeInv;
					uniform 	float _DepthScale;
					uniform lowp sampler2D _PointsTex;
					uniform highp sampler2D _CameraDepthTexture;
					varying highp vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat4;
					float u_xlat7;
					float u_xlat9;
					float u_xlat10;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_PointsTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xy = u_xlat10_0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat16_0.xy * _DTSizeInv.xy + vec2(0.5, 0.5);
					    u_xlat1.xy = ceil(u_xlat0.xy);
					    u_xlat1.xy = u_xlat1.xy + vec2(-0.49000001, -0.49000001);
					    u_xlat1.zw = u_xlat1.xy * _DTSizeInv.zw;
					    u_xlat9 = texture2D(_CameraDepthTexture, u_xlat1.zw).x;
					    u_xlat9 = _ZBufferParams.z * u_xlat9 + _ZBufferParams.w;
					    u_xlat9 = float(1.0) / u_xlat9;
					    u_xlat2.xy = floor(u_xlat0.xy);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat2.xy = u_xlat2.xy + vec2(-0.49000001, -0.49000001);
					    u_xlat1.xy = u_xlat2.xy * _DTSizeInv.zw;
					    u_xlat10 = texture2D(_CameraDepthTexture, u_xlat1.xw).x;
					    u_xlat7 = texture2D(_CameraDepthTexture, u_xlat1.zy).x;
					    u_xlat1.x = texture2D(_CameraDepthTexture, u_xlat1.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat4 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
					    u_xlat4 = float(1.0) / u_xlat4;
					    u_xlat4 = (-u_xlat1.x) + u_xlat4;
					    u_xlat1.x = u_xlat0.x * u_xlat4 + u_xlat1.x;
					    u_xlat4 = _ZBufferParams.z * u_xlat10 + _ZBufferParams.w;
					    u_xlat4 = float(1.0) / u_xlat4;
					    u_xlat9 = u_xlat9 + (-u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat9 + u_xlat4;
					    u_xlat0.x = (-u_xlat1.x) + u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * u_xlat0.x + u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * _DepthScale;
					    u_xlatb0 = u_xlat0.x>=u_xlat10_0.z;
					    SV_Target0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(bvec4(u_xlatb0)));
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
					attribute highp vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 _DTSizeInv;
					uniform 	float _DepthScale;
					uniform lowp sampler2D _PointsTex;
					uniform highp sampler2D _CameraDepthTexture;
					varying highp vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat4;
					float u_xlat7;
					float u_xlat9;
					float u_xlat10;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_PointsTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xy = u_xlat10_0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat16_0.xy * _DTSizeInv.xy + vec2(0.5, 0.5);
					    u_xlat1.xy = ceil(u_xlat0.xy);
					    u_xlat1.xy = u_xlat1.xy + vec2(-0.49000001, -0.49000001);
					    u_xlat1.zw = u_xlat1.xy * _DTSizeInv.zw;
					    u_xlat9 = texture2D(_CameraDepthTexture, u_xlat1.zw).x;
					    u_xlat9 = _ZBufferParams.z * u_xlat9 + _ZBufferParams.w;
					    u_xlat9 = float(1.0) / u_xlat9;
					    u_xlat2.xy = floor(u_xlat0.xy);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat2.xy = u_xlat2.xy + vec2(-0.49000001, -0.49000001);
					    u_xlat1.xy = u_xlat2.xy * _DTSizeInv.zw;
					    u_xlat10 = texture2D(_CameraDepthTexture, u_xlat1.xw).x;
					    u_xlat7 = texture2D(_CameraDepthTexture, u_xlat1.zy).x;
					    u_xlat1.x = texture2D(_CameraDepthTexture, u_xlat1.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat4 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
					    u_xlat4 = float(1.0) / u_xlat4;
					    u_xlat4 = (-u_xlat1.x) + u_xlat4;
					    u_xlat1.x = u_xlat0.x * u_xlat4 + u_xlat1.x;
					    u_xlat4 = _ZBufferParams.z * u_xlat10 + _ZBufferParams.w;
					    u_xlat4 = float(1.0) / u_xlat4;
					    u_xlat9 = u_xlat9 + (-u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat9 + u_xlat4;
					    u_xlat0.x = (-u_xlat1.x) + u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * u_xlat0.x + u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * _DepthScale;
					    u_xlatb0 = u_xlat0.x>=u_xlat10_0.z;
					    SV_Target0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(bvec4(u_xlatb0)));
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
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 _DTSizeInv;
					uniform 	float _DepthScale;
					UNITY_LOCATION(0) uniform mediump sampler2D _PointsTex;
					UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec3 u_xlat16_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat4;
					float u_xlat7;
					float u_xlat9;
					float u_xlat10;
					void main()
					{
					    u_xlat16_0.xyz = texture(_PointsTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xy = u_xlat16_0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat16_0.xy * _DTSizeInv.xy + vec2(0.5, 0.5);
					    u_xlat1.xy = ceil(u_xlat0.xy);
					    u_xlat1.xy = u_xlat1.xy + vec2(-0.49000001, -0.49000001);
					    u_xlat1.zw = u_xlat1.xy * _DTSizeInv.zw;
					    u_xlat9 = texture(_CameraDepthTexture, u_xlat1.zw).x;
					    u_xlat9 = _ZBufferParams.z * u_xlat9 + _ZBufferParams.w;
					    u_xlat9 = float(1.0) / u_xlat9;
					    u_xlat2.xy = floor(u_xlat0.xy);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat2.xy = u_xlat2.xy + vec2(-0.49000001, -0.49000001);
					    u_xlat1.xy = u_xlat2.xy * _DTSizeInv.zw;
					    u_xlat10 = texture(_CameraDepthTexture, u_xlat1.xw).x;
					    u_xlat7 = texture(_CameraDepthTexture, u_xlat1.zy).x;
					    u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat4 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
					    u_xlat4 = float(1.0) / u_xlat4;
					    u_xlat4 = (-u_xlat1.x) + u_xlat4;
					    u_xlat1.x = u_xlat0.x * u_xlat4 + u_xlat1.x;
					    u_xlat4 = _ZBufferParams.z * u_xlat10 + _ZBufferParams.w;
					    u_xlat4 = float(1.0) / u_xlat4;
					    u_xlat9 = u_xlat9 + (-u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat9 + u_xlat4;
					    u_xlat0.x = (-u_xlat1.x) + u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * u_xlat0.x + u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * _DepthScale;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0.x>=u_xlat16_0.z);
					#else
					    u_xlatb0 = u_xlat0.x>=u_xlat16_0.z;
					#endif
					    SV_Target0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(bvec4(u_xlatb0)));
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
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 _DTSizeInv;
					uniform 	float _DepthScale;
					UNITY_LOCATION(0) uniform mediump sampler2D _PointsTex;
					UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec3 u_xlat16_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat4;
					float u_xlat7;
					float u_xlat9;
					float u_xlat10;
					void main()
					{
					    u_xlat16_0.xyz = texture(_PointsTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xy = u_xlat16_0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat16_0.xy * _DTSizeInv.xy + vec2(0.5, 0.5);
					    u_xlat1.xy = ceil(u_xlat0.xy);
					    u_xlat1.xy = u_xlat1.xy + vec2(-0.49000001, -0.49000001);
					    u_xlat1.zw = u_xlat1.xy * _DTSizeInv.zw;
					    u_xlat9 = texture(_CameraDepthTexture, u_xlat1.zw).x;
					    u_xlat9 = _ZBufferParams.z * u_xlat9 + _ZBufferParams.w;
					    u_xlat9 = float(1.0) / u_xlat9;
					    u_xlat2.xy = floor(u_xlat0.xy);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat2.xy = u_xlat2.xy + vec2(-0.49000001, -0.49000001);
					    u_xlat1.xy = u_xlat2.xy * _DTSizeInv.zw;
					    u_xlat10 = texture(_CameraDepthTexture, u_xlat1.xw).x;
					    u_xlat7 = texture(_CameraDepthTexture, u_xlat1.zy).x;
					    u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat4 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
					    u_xlat4 = float(1.0) / u_xlat4;
					    u_xlat4 = (-u_xlat1.x) + u_xlat4;
					    u_xlat1.x = u_xlat0.x * u_xlat4 + u_xlat1.x;
					    u_xlat4 = _ZBufferParams.z * u_xlat10 + _ZBufferParams.w;
					    u_xlat4 = float(1.0) / u_xlat4;
					    u_xlat9 = u_xlat9 + (-u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat9 + u_xlat4;
					    u_xlat0.x = (-u_xlat1.x) + u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * u_xlat0.x + u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * _DepthScale;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0.x>=u_xlat16_0.z);
					#else
					    u_xlatb0 = u_xlat0.x>=u_xlat16_0.z;
					#endif
					    SV_Target0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(bvec4(u_xlatb0)));
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
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 _DTSizeInv;
					uniform 	float _DepthScale;
					UNITY_LOCATION(0) uniform mediump sampler2D _PointsTex;
					UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec3 u_xlat16_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat4;
					float u_xlat7;
					float u_xlat9;
					float u_xlat10;
					void main()
					{
					    u_xlat16_0.xyz = texture(_PointsTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xy = u_xlat16_0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat16_0.xy * _DTSizeInv.xy + vec2(0.5, 0.5);
					    u_xlat1.xy = ceil(u_xlat0.xy);
					    u_xlat1.xy = u_xlat1.xy + vec2(-0.49000001, -0.49000001);
					    u_xlat1.zw = u_xlat1.xy * _DTSizeInv.zw;
					    u_xlat9 = texture(_CameraDepthTexture, u_xlat1.zw).x;
					    u_xlat9 = _ZBufferParams.z * u_xlat9 + _ZBufferParams.w;
					    u_xlat9 = float(1.0) / u_xlat9;
					    u_xlat2.xy = floor(u_xlat0.xy);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat2.xy = u_xlat2.xy + vec2(-0.49000001, -0.49000001);
					    u_xlat1.xy = u_xlat2.xy * _DTSizeInv.zw;
					    u_xlat10 = texture(_CameraDepthTexture, u_xlat1.xw).x;
					    u_xlat7 = texture(_CameraDepthTexture, u_xlat1.zy).x;
					    u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat4 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
					    u_xlat4 = float(1.0) / u_xlat4;
					    u_xlat4 = (-u_xlat1.x) + u_xlat4;
					    u_xlat1.x = u_xlat0.x * u_xlat4 + u_xlat1.x;
					    u_xlat4 = _ZBufferParams.z * u_xlat10 + _ZBufferParams.w;
					    u_xlat4 = float(1.0) / u_xlat4;
					    u_xlat9 = u_xlat9 + (-u_xlat4);
					    u_xlat0.x = u_xlat0.x * u_xlat9 + u_xlat4;
					    u_xlat0.x = (-u_xlat1.x) + u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * u_xlat0.x + u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * _DepthScale;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0.x>=u_xlat16_0.z);
					#else
					    u_xlatb0 = u_xlat0.x>=u_xlat16_0.z;
					#endif
					    SV_Target0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(bvec4(u_xlatb0)));
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
}