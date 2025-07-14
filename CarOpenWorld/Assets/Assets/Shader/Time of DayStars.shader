Shader "Time of Day/Stars" {
	Properties {
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Background+20" "RenderType" = "Background" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Background+20" "RenderType" = "Background" }
			Blend One One, One One
			ZWrite Off
			Fog {
				Mode Off
			}
			GpuProgramID 15295
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	float TOD_StarSize;
					uniform 	float TOD_StarBrightness;
					uniform 	float TOD_StarVisibility;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TANGENT0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xyz = in_TANGENT0.yzx * in_NORMAL0.zxy;
					    u_xlat0.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat0.xyz);
					    u_xlat1.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.yyy;
					    u_xlat1.xyz = u_xlat1.xxx * in_TANGENT0.xyz;
					    u_xlat12 = max(hlslcc_mtx4x4glstate_matrix_projection[0].x, 0.100000001);
					    u_xlat12 = float(1.0) / u_xlat12;
					    u_xlat12 = u_xlat12 * 4.0;
					    u_xlat12 = u_xlat12 / _ScreenParams.x;
					    u_xlat13 = u_xlat12 * TOD_StarSize;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat13) + in_POSITION0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat13) + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat0.x = TOD_StarBrightness * TOD_StarVisibility;
					    u_xlat0.x = u_xlat0.x * 9.99999975e-06;
					    u_xlat0.x = u_xlat0.x * in_COLOR0.w;
					    u_xlat0.x = u_xlat0.x / u_xlat12;
					    vs_COLOR0.xyz = sqrt(u_xlat0.xxx);
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat1.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1 = vs_TEXCOORD0.z;
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vs_COLOR0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	float TOD_StarSize;
					uniform 	float TOD_StarBrightness;
					uniform 	float TOD_StarVisibility;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TANGENT0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xyz = in_TANGENT0.yzx * in_NORMAL0.zxy;
					    u_xlat0.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat0.xyz);
					    u_xlat1.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.yyy;
					    u_xlat1.xyz = u_xlat1.xxx * in_TANGENT0.xyz;
					    u_xlat12 = max(hlslcc_mtx4x4glstate_matrix_projection[0].x, 0.100000001);
					    u_xlat12 = float(1.0) / u_xlat12;
					    u_xlat12 = u_xlat12 * 4.0;
					    u_xlat12 = u_xlat12 / _ScreenParams.x;
					    u_xlat13 = u_xlat12 * TOD_StarSize;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat13) + in_POSITION0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat13) + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat0.x = TOD_StarBrightness * TOD_StarVisibility;
					    u_xlat0.x = u_xlat0.x * 9.99999975e-06;
					    u_xlat0.x = u_xlat0.x * in_COLOR0.w;
					    u_xlat0.x = u_xlat0.x / u_xlat12;
					    vs_COLOR0.xyz = sqrt(u_xlat0.xxx);
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat1.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1 = vs_TEXCOORD0.z;
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vs_COLOR0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	float TOD_StarSize;
					uniform 	float TOD_StarBrightness;
					uniform 	float TOD_StarVisibility;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TANGENT0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xyz = in_TANGENT0.yzx * in_NORMAL0.zxy;
					    u_xlat0.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat0.xyz);
					    u_xlat1.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.yyy;
					    u_xlat1.xyz = u_xlat1.xxx * in_TANGENT0.xyz;
					    u_xlat12 = max(hlslcc_mtx4x4glstate_matrix_projection[0].x, 0.100000001);
					    u_xlat12 = float(1.0) / u_xlat12;
					    u_xlat12 = u_xlat12 * 4.0;
					    u_xlat12 = u_xlat12 / _ScreenParams.x;
					    u_xlat13 = u_xlat12 * TOD_StarSize;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat13) + in_POSITION0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat13) + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat0.x = TOD_StarBrightness * TOD_StarVisibility;
					    u_xlat0.x = u_xlat0.x * 9.99999975e-06;
					    u_xlat0.x = u_xlat0.x * in_COLOR0.w;
					    u_xlat0.x = u_xlat0.x / u_xlat12;
					    vs_COLOR0.xyz = sqrt(u_xlat0.xxx);
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat1.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1 = vs_TEXCOORD0.z;
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vs_COLOR0.xyz;
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	float TOD_StarSize;
					uniform 	float TOD_StarBrightness;
					uniform 	float TOD_StarVisibility;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TANGENT0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in mediump vec4 in_COLOR0;
					out mediump vec3 vs_COLOR0;
					out mediump vec3 vs_TEXCOORD0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xyz = in_TANGENT0.yzx * in_NORMAL0.zxy;
					    u_xlat0.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat0.xyz);
					    u_xlat1.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.yyy;
					    u_xlat1.xyz = u_xlat1.xxx * in_TANGENT0.xyz;
					    u_xlat12 = max(hlslcc_mtx4x4glstate_matrix_projection[0].x, 0.100000001);
					    u_xlat12 = float(1.0) / u_xlat12;
					    u_xlat12 = u_xlat12 * 4.0;
					    u_xlat12 = u_xlat12 / _ScreenParams.x;
					    u_xlat13 = u_xlat12 * TOD_StarSize;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat13) + in_POSITION0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat13) + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat0.x = TOD_StarBrightness * TOD_StarVisibility;
					    u_xlat0.x = u_xlat0.x * 9.99999975e-06;
					    u_xlat0.x = u_xlat0.x * in_COLOR0.w;
					    u_xlat0.x = u_xlat0.x / u_xlat12;
					    vs_COLOR0.xyz = sqrt(u_xlat0.xxx);
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat1.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in mediump vec3 vs_COLOR0;
					in mediump vec3 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1 = vs_TEXCOORD0.z;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
					#else
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					#endif
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vs_COLOR0.xyz;
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	float TOD_StarSize;
					uniform 	float TOD_StarBrightness;
					uniform 	float TOD_StarVisibility;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TANGENT0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in mediump vec4 in_COLOR0;
					out mediump vec3 vs_COLOR0;
					out mediump vec3 vs_TEXCOORD0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xyz = in_TANGENT0.yzx * in_NORMAL0.zxy;
					    u_xlat0.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat0.xyz);
					    u_xlat1.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.yyy;
					    u_xlat1.xyz = u_xlat1.xxx * in_TANGENT0.xyz;
					    u_xlat12 = max(hlslcc_mtx4x4glstate_matrix_projection[0].x, 0.100000001);
					    u_xlat12 = float(1.0) / u_xlat12;
					    u_xlat12 = u_xlat12 * 4.0;
					    u_xlat12 = u_xlat12 / _ScreenParams.x;
					    u_xlat13 = u_xlat12 * TOD_StarSize;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat13) + in_POSITION0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat13) + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat0.x = TOD_StarBrightness * TOD_StarVisibility;
					    u_xlat0.x = u_xlat0.x * 9.99999975e-06;
					    u_xlat0.x = u_xlat0.x * in_COLOR0.w;
					    u_xlat0.x = u_xlat0.x / u_xlat12;
					    vs_COLOR0.xyz = sqrt(u_xlat0.xxx);
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat1.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in mediump vec3 vs_COLOR0;
					in mediump vec3 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1 = vs_TEXCOORD0.z;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
					#else
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					#endif
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vs_COLOR0.xyz;
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	float TOD_StarSize;
					uniform 	float TOD_StarBrightness;
					uniform 	float TOD_StarVisibility;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TANGENT0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in mediump vec4 in_COLOR0;
					out mediump vec3 vs_COLOR0;
					out mediump vec3 vs_TEXCOORD0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xyz = in_TANGENT0.yzx * in_NORMAL0.zxy;
					    u_xlat0.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat0.xyz);
					    u_xlat1.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.yyy;
					    u_xlat1.xyz = u_xlat1.xxx * in_TANGENT0.xyz;
					    u_xlat12 = max(hlslcc_mtx4x4glstate_matrix_projection[0].x, 0.100000001);
					    u_xlat12 = float(1.0) / u_xlat12;
					    u_xlat12 = u_xlat12 * 4.0;
					    u_xlat12 = u_xlat12 / _ScreenParams.x;
					    u_xlat13 = u_xlat12 * TOD_StarSize;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat13) + in_POSITION0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat13) + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat0.x = TOD_StarBrightness * TOD_StarVisibility;
					    u_xlat0.x = u_xlat0.x * 9.99999975e-06;
					    u_xlat0.x = u_xlat0.x * in_COLOR0.w;
					    u_xlat0.x = u_xlat0.x / u_xlat12;
					    vs_COLOR0.xyz = sqrt(u_xlat0.xxx);
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat1.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in mediump vec3 vs_COLOR0;
					in mediump vec3 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1 = vs_TEXCOORD0.z;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
					#else
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					#endif
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vs_COLOR0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	float TOD_StarSize;
					uniform 	float TOD_StarBrightness;
					uniform 	float TOD_StarVisibility;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TANGENT0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xyz = in_TANGENT0.yzx * in_NORMAL0.zxy;
					    u_xlat0.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat0.xyz);
					    u_xlat1.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.yyy;
					    u_xlat1.xyz = u_xlat1.xxx * in_TANGENT0.xyz;
					    u_xlat12 = max(hlslcc_mtx4x4glstate_matrix_projection[0].x, 0.100000001);
					    u_xlat12 = float(1.0) / u_xlat12;
					    u_xlat12 = u_xlat12 * 4.0;
					    u_xlat12 = u_xlat12 / _ScreenParams.x;
					    u_xlat13 = u_xlat12 * TOD_StarSize;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat13) + in_POSITION0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat13) + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat0.x = TOD_StarBrightness * TOD_StarVisibility;
					    u_xlat0.x = u_xlat0.x * 9.99999975e-06;
					    u_xlat0.x = u_xlat0.x * in_COLOR0.w;
					    u_xlat0.xyz = u_xlat0.xxx / vec3(u_xlat12);
					    vs_COLOR0.xyz = u_xlat0.xyz;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat1.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1 = vs_TEXCOORD0.z;
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vs_COLOR0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	float TOD_StarSize;
					uniform 	float TOD_StarBrightness;
					uniform 	float TOD_StarVisibility;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TANGENT0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xyz = in_TANGENT0.yzx * in_NORMAL0.zxy;
					    u_xlat0.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat0.xyz);
					    u_xlat1.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.yyy;
					    u_xlat1.xyz = u_xlat1.xxx * in_TANGENT0.xyz;
					    u_xlat12 = max(hlslcc_mtx4x4glstate_matrix_projection[0].x, 0.100000001);
					    u_xlat12 = float(1.0) / u_xlat12;
					    u_xlat12 = u_xlat12 * 4.0;
					    u_xlat12 = u_xlat12 / _ScreenParams.x;
					    u_xlat13 = u_xlat12 * TOD_StarSize;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat13) + in_POSITION0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat13) + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat0.x = TOD_StarBrightness * TOD_StarVisibility;
					    u_xlat0.x = u_xlat0.x * 9.99999975e-06;
					    u_xlat0.x = u_xlat0.x * in_COLOR0.w;
					    u_xlat0.xyz = u_xlat0.xxx / vec3(u_xlat12);
					    vs_COLOR0.xyz = u_xlat0.xyz;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat1.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1 = vs_TEXCOORD0.z;
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vs_COLOR0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	float TOD_StarSize;
					uniform 	float TOD_StarBrightness;
					uniform 	float TOD_StarVisibility;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TANGENT0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xyz = in_TANGENT0.yzx * in_NORMAL0.zxy;
					    u_xlat0.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat0.xyz);
					    u_xlat1.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.yyy;
					    u_xlat1.xyz = u_xlat1.xxx * in_TANGENT0.xyz;
					    u_xlat12 = max(hlslcc_mtx4x4glstate_matrix_projection[0].x, 0.100000001);
					    u_xlat12 = float(1.0) / u_xlat12;
					    u_xlat12 = u_xlat12 * 4.0;
					    u_xlat12 = u_xlat12 / _ScreenParams.x;
					    u_xlat13 = u_xlat12 * TOD_StarSize;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat13) + in_POSITION0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat13) + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat0.x = TOD_StarBrightness * TOD_StarVisibility;
					    u_xlat0.x = u_xlat0.x * 9.99999975e-06;
					    u_xlat0.x = u_xlat0.x * in_COLOR0.w;
					    u_xlat0.xyz = u_xlat0.xxx / vec3(u_xlat12);
					    vs_COLOR0.xyz = u_xlat0.xyz;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat1.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					varying mediump vec3 vs_COLOR0;
					varying mediump vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1 = vs_TEXCOORD0.z;
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vs_COLOR0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	float TOD_StarSize;
					uniform 	float TOD_StarBrightness;
					uniform 	float TOD_StarVisibility;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TANGENT0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in mediump vec4 in_COLOR0;
					out mediump vec3 vs_COLOR0;
					out mediump vec3 vs_TEXCOORD0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xyz = in_TANGENT0.yzx * in_NORMAL0.zxy;
					    u_xlat0.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat0.xyz);
					    u_xlat1.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.yyy;
					    u_xlat1.xyz = u_xlat1.xxx * in_TANGENT0.xyz;
					    u_xlat12 = max(hlslcc_mtx4x4glstate_matrix_projection[0].x, 0.100000001);
					    u_xlat12 = float(1.0) / u_xlat12;
					    u_xlat12 = u_xlat12 * 4.0;
					    u_xlat12 = u_xlat12 / _ScreenParams.x;
					    u_xlat13 = u_xlat12 * TOD_StarSize;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat13) + in_POSITION0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat13) + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat0.x = TOD_StarBrightness * TOD_StarVisibility;
					    u_xlat0.x = u_xlat0.x * 9.99999975e-06;
					    u_xlat0.x = u_xlat0.x * in_COLOR0.w;
					    u_xlat0.xyz = u_xlat0.xxx / vec3(u_xlat12);
					    vs_COLOR0.xyz = u_xlat0.xyz;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat1.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in mediump vec3 vs_COLOR0;
					in mediump vec3 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1 = vs_TEXCOORD0.z;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
					#else
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					#endif
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vs_COLOR0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	float TOD_StarSize;
					uniform 	float TOD_StarBrightness;
					uniform 	float TOD_StarVisibility;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TANGENT0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in mediump vec4 in_COLOR0;
					out mediump vec3 vs_COLOR0;
					out mediump vec3 vs_TEXCOORD0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xyz = in_TANGENT0.yzx * in_NORMAL0.zxy;
					    u_xlat0.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat0.xyz);
					    u_xlat1.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.yyy;
					    u_xlat1.xyz = u_xlat1.xxx * in_TANGENT0.xyz;
					    u_xlat12 = max(hlslcc_mtx4x4glstate_matrix_projection[0].x, 0.100000001);
					    u_xlat12 = float(1.0) / u_xlat12;
					    u_xlat12 = u_xlat12 * 4.0;
					    u_xlat12 = u_xlat12 / _ScreenParams.x;
					    u_xlat13 = u_xlat12 * TOD_StarSize;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat13) + in_POSITION0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat13) + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat0.x = TOD_StarBrightness * TOD_StarVisibility;
					    u_xlat0.x = u_xlat0.x * 9.99999975e-06;
					    u_xlat0.x = u_xlat0.x * in_COLOR0.w;
					    u_xlat0.xyz = u_xlat0.xxx / vec3(u_xlat12);
					    vs_COLOR0.xyz = u_xlat0.xyz;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat1.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in mediump vec3 vs_COLOR0;
					in mediump vec3 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1 = vs_TEXCOORD0.z;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
					#else
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					#endif
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vs_COLOR0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4TOD_World2Sky[4];
					uniform 	float TOD_StarSize;
					uniform 	float TOD_StarBrightness;
					uniform 	float TOD_StarVisibility;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TANGENT0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in mediump vec4 in_COLOR0;
					out mediump vec3 vs_COLOR0;
					out mediump vec3 vs_TEXCOORD0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xyz = in_TANGENT0.yzx * in_NORMAL0.zxy;
					    u_xlat0.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat0.xyz);
					    u_xlat1.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.yyy;
					    u_xlat1.xyz = u_xlat1.xxx * in_TANGENT0.xyz;
					    u_xlat12 = max(hlslcc_mtx4x4glstate_matrix_projection[0].x, 0.100000001);
					    u_xlat12 = float(1.0) / u_xlat12;
					    u_xlat12 = u_xlat12 * 4.0;
					    u_xlat12 = u_xlat12 / _ScreenParams.x;
					    u_xlat13 = u_xlat12 * TOD_StarSize;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat13) + in_POSITION0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat13) + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat0.x = TOD_StarBrightness * TOD_StarVisibility;
					    u_xlat0.x = u_xlat0.x * 9.99999975e-06;
					    u_xlat0.x = u_xlat0.x * in_COLOR0.w;
					    u_xlat0.xyz = u_xlat0.xxx / vec3(u_xlat12);
					    vs_COLOR0.xyz = u_xlat0.xyz;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4TOD_World2Sky[1].y;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[0].y * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[2].y * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4TOD_World2Sky[3].y * u_xlat1.w + u_xlat0.x;
					    u_xlat0.z = u_xlat0.x * 25.0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in mediump vec3 vs_COLOR0;
					in mediump vec3 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1 = vs_TEXCOORD0.z;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
					#else
					    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
					#endif
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
					    SV_Target0.xyz = vec3(u_xlat16_0) * vs_COLOR0.xyz;
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
				SubProgram "gles hw_tier00 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "TOD_OUTPUT_LINEAR" }
					"!!GLES3"
				}
			}
		}
	}
}