Shader "Time of Day/Moon" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Background+40" "RenderType" = "Background" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Background+40" "RenderType" = "Background" }
			ZWrite Off
			Fog {
				Mode Off
			}
			GpuProgramID 60827
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying mediump vec3 vs_TEXCOORD0;
					varying mediump vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat3 = u_xlat0.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat0.x + u_xlat3;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat0.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
					uniform 	vec3 TOD_MoonMeshColor;
					uniform 	vec3 TOD_SunDirection;
					uniform 	float TOD_MoonMeshContrast;
					uniform 	float TOD_MoonMeshBrightness;
					uniform lowp sampler2D _MainTex;
					varying mediump vec3 vs_TEXCOORD0;
					varying mediump vec3 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					mediump vec3 u_xlat16_1;
					float u_xlat2;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0 = dot(vs_TEXCOORD1.xyz, TOD_SunDirection.xyz);
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat0 = log2(u_xlat0);
					    u_xlat0 = u_xlat0 * TOD_MoonMeshContrast;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat16_1.x = vs_TEXCOORD0.z;
					    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
					    u_xlat2 = u_xlat16_1.x * TOD_MoonMeshBrightness;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = vec3(u_xlat0) * u_xlat10_2.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz * TOD_MoonMeshColor.xyz;
					    SV_Target0.w = 0.0;
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
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying mediump vec3 vs_TEXCOORD0;
					varying mediump vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat3 = u_xlat0.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat0.x + u_xlat3;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat0.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
					uniform 	vec3 TOD_MoonMeshColor;
					uniform 	vec3 TOD_SunDirection;
					uniform 	float TOD_MoonMeshContrast;
					uniform 	float TOD_MoonMeshBrightness;
					uniform lowp sampler2D _MainTex;
					varying mediump vec3 vs_TEXCOORD0;
					varying mediump vec3 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					mediump vec3 u_xlat16_1;
					float u_xlat2;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0 = dot(vs_TEXCOORD1.xyz, TOD_SunDirection.xyz);
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat0 = log2(u_xlat0);
					    u_xlat0 = u_xlat0 * TOD_MoonMeshContrast;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat16_1.x = vs_TEXCOORD0.z;
					    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
					    u_xlat2 = u_xlat16_1.x * TOD_MoonMeshBrightness;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = vec3(u_xlat0) * u_xlat10_2.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz * TOD_MoonMeshColor.xyz;
					    SV_Target0.w = 0.0;
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
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying mediump vec3 vs_TEXCOORD0;
					varying mediump vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat3 = u_xlat0.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat0.x + u_xlat3;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat0.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
					uniform 	vec3 TOD_MoonMeshColor;
					uniform 	vec3 TOD_SunDirection;
					uniform 	float TOD_MoonMeshContrast;
					uniform 	float TOD_MoonMeshBrightness;
					uniform lowp sampler2D _MainTex;
					varying mediump vec3 vs_TEXCOORD0;
					varying mediump vec3 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					mediump vec3 u_xlat16_1;
					float u_xlat2;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0 = dot(vs_TEXCOORD1.xyz, TOD_SunDirection.xyz);
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat0 = log2(u_xlat0);
					    u_xlat0 = u_xlat0 * TOD_MoonMeshContrast;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat16_1.x = vs_TEXCOORD0.z;
					    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
					    u_xlat2 = u_xlat16_1.x * TOD_MoonMeshBrightness;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = vec3(u_xlat0) * u_xlat10_2.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz * TOD_MoonMeshColor.xyz;
					    SV_Target0.w = 0.0;
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
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out mediump vec3 vs_TEXCOORD0;
					out mediump vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat3 = u_xlat0.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat0.x + u_xlat3;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat0.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
					uniform 	vec3 TOD_MoonMeshColor;
					uniform 	vec3 TOD_SunDirection;
					uniform 	float TOD_MoonMeshContrast;
					uniform 	float TOD_MoonMeshBrightness;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in mediump vec3 vs_TEXCOORD0;
					in mediump vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					float u_xlat0;
					mediump vec3 u_xlat16_1;
					float u_xlat2;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0 = dot(vs_TEXCOORD1.xyz, TOD_SunDirection.xyz);
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat0 = log2(u_xlat0);
					    u_xlat0 = u_xlat0 * TOD_MoonMeshContrast;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat16_1.x = vs_TEXCOORD0.z;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
					#else
					    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
					#endif
					    u_xlat2 = u_xlat16_1.x * TOD_MoonMeshBrightness;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = vec3(u_xlat0) * u_xlat16_2.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz * TOD_MoonMeshColor.xyz;
					    SV_Target0.w = 0.0;
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
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out mediump vec3 vs_TEXCOORD0;
					out mediump vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat3 = u_xlat0.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat0.x + u_xlat3;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat0.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
					uniform 	vec3 TOD_MoonMeshColor;
					uniform 	vec3 TOD_SunDirection;
					uniform 	float TOD_MoonMeshContrast;
					uniform 	float TOD_MoonMeshBrightness;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in mediump vec3 vs_TEXCOORD0;
					in mediump vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					float u_xlat0;
					mediump vec3 u_xlat16_1;
					float u_xlat2;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0 = dot(vs_TEXCOORD1.xyz, TOD_SunDirection.xyz);
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat0 = log2(u_xlat0);
					    u_xlat0 = u_xlat0 * TOD_MoonMeshContrast;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat16_1.x = vs_TEXCOORD0.z;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
					#else
					    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
					#endif
					    u_xlat2 = u_xlat16_1.x * TOD_MoonMeshBrightness;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = vec3(u_xlat0) * u_xlat16_2.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz * TOD_MoonMeshColor.xyz;
					    SV_Target0.w = 0.0;
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
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out mediump vec3 vs_TEXCOORD0;
					out mediump vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat3 = u_xlat0.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat0.x + u_xlat3;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat0.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
					uniform 	vec3 TOD_MoonMeshColor;
					uniform 	vec3 TOD_SunDirection;
					uniform 	float TOD_MoonMeshContrast;
					uniform 	float TOD_MoonMeshBrightness;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in mediump vec3 vs_TEXCOORD0;
					in mediump vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					float u_xlat0;
					mediump vec3 u_xlat16_1;
					float u_xlat2;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0 = dot(vs_TEXCOORD1.xyz, TOD_SunDirection.xyz);
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat0 = log2(u_xlat0);
					    u_xlat0 = u_xlat0 * TOD_MoonMeshContrast;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat16_1.x = vs_TEXCOORD0.z;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
					#else
					    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
					#endif
					    u_xlat2 = u_xlat16_1.x * TOD_MoonMeshBrightness;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = vec3(u_xlat0) * u_xlat16_2.xyz;
					    SV_Target0.xyz = u_xlat16_1.xyz * TOD_MoonMeshColor.xyz;
					    SV_Target0.w = 0.0;
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