Shader "Hidden/Image Effects/Cinematic/AmbientOcclusion" {
	Properties {
		_MainTex ("", 2D) = "" {}
		_OcclusionTexture ("", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 62068
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					uniform lowp sampler2D _CameraDepthNormalsTexture;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					int u_xlati6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					float u_xlat10;
					ivec2 u_xlati10;
					bvec2 u_xlatb10;
					vec3 u_xlat13;
					mediump float u_xlat16_18;
					bvec2 u_xlatb19;
					vec2 u_xlat20;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					int u_xlati29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					int u_xlati32;
					bool u_xlatb32;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
					ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
					ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
					ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_18 = 2.0 / u_xlat16_18;
					    u_xlat1.xy = u_xlat16_0.xy * vec2(u_xlat16_18);
					    u_xlat1.z = u_xlat16_18 + -1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat27 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat27 + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlatb10.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati10.x = op_or((int(u_xlatb10.y) * -1), (int(u_xlatb10.x) * -1));
					    u_xlatb19.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati10.y = op_or((int(u_xlatb19.y) * -1), (int(u_xlatb19.x) * -1));
					    u_xlati10.xy = op_and(u_xlati10.xy, ivec2(1, 1));
					    u_xlati10.x = u_xlati10.y + u_xlati10.x;
					    u_xlat10 = float(u_xlati10.x);
					    u_xlatb27 = u_xlat27>=0.999989986;
					    u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					    u_xlat27 = u_xlat27 + u_xlat10;
					    u_xlat27 = u_xlat27 * 100000000.0 + u_xlat1.x;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat16_1.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.z = 1.0;
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat28 = fract(u_xlat28);
					    u_xlat28 = u_xlat28 * 52.9829178;
					    u_xlat28 = fract(u_xlat28);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat20.x = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<5 ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat30 = u_xlat4.y * 78.2330017;
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat6.z = u_xlat30 * 2.0 + -1.0;
					        u_xlat30 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = u_xlat30 * 6.28318548;
					        u_xlat7 = sin(u_xlat30);
					        u_xlat8.x = cos(u_xlat30);
					        u_xlat30 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat30) * u_xlat8.xy;
					        u_xlat30 = u_xlat4.y + 1.0;
					        u_xlat30 = u_xlat30 * 0.200000003;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat30 = u_xlat30 * _Radius;
					        u_xlat13.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot((-u_xlat0.xyz), u_xlat13.xyz);
					        u_xlatb30 = u_xlat30>=0.0;
					        u_xlat13.xyz = (bool(u_xlatb30)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat1.xyz * vec3(u_xlat27) + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat30 = texture2D(_CameraDepthTexture, u_xlat6.xy).x;
					        u_xlat31 = _ZBufferParams.z * u_xlat30 + _ZBufferParams.w;
					        u_xlat31 = float(1.0) / u_xlat31;
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb32 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati32 = u_xlatb32 ? 1 : int(0);
					        u_xlatb6.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlatb6.x = u_xlatb6.y || u_xlatb6.x;
					        u_xlati6 = u_xlatb6.x ? 1 : int(0);
					        u_xlati32 = u_xlati32 + u_xlati6;
					        u_xlat32 = float(u_xlati32);
					        u_xlatb30 = u_xlat30>=0.999989986;
					        u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
					        u_xlat30 = u_xlat30 + u_xlat32;
					        u_xlat30 = u_xlat30 * 100000000.0 + u_xlat31;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat30) + (-u_xlat3.xyz);
					        u_xlat30 = dot(u_xlat13.xyz, u_xlat0.xyz);
					        u_xlat30 = (-u_xlat27) * 0.00200000009 + u_xlat30;
					        u_xlat30 = max(u_xlat30, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat30 = u_xlat30 / u_xlat13.x;
					        u_xlat20.x = u_xlat20.x + u_xlat30;
					    }
					    u_xlat0.x = u_xlat20.x * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x * 0.200000003;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					uniform lowp sampler2D _CameraDepthNormalsTexture;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					int u_xlati6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					float u_xlat10;
					ivec2 u_xlati10;
					bvec2 u_xlatb10;
					vec3 u_xlat13;
					mediump float u_xlat16_18;
					bvec2 u_xlatb19;
					vec2 u_xlat20;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					int u_xlati29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					int u_xlati32;
					bool u_xlatb32;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
					ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
					ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
					ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_18 = 2.0 / u_xlat16_18;
					    u_xlat1.xy = u_xlat16_0.xy * vec2(u_xlat16_18);
					    u_xlat1.z = u_xlat16_18 + -1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat27 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat27 + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlatb10.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati10.x = op_or((int(u_xlatb10.y) * -1), (int(u_xlatb10.x) * -1));
					    u_xlatb19.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati10.y = op_or((int(u_xlatb19.y) * -1), (int(u_xlatb19.x) * -1));
					    u_xlati10.xy = op_and(u_xlati10.xy, ivec2(1, 1));
					    u_xlati10.x = u_xlati10.y + u_xlati10.x;
					    u_xlat10 = float(u_xlati10.x);
					    u_xlatb27 = u_xlat27>=0.999989986;
					    u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					    u_xlat27 = u_xlat27 + u_xlat10;
					    u_xlat27 = u_xlat27 * 100000000.0 + u_xlat1.x;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat16_1.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.z = 1.0;
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat28 = fract(u_xlat28);
					    u_xlat28 = u_xlat28 * 52.9829178;
					    u_xlat28 = fract(u_xlat28);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat20.x = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<5 ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat30 = u_xlat4.y * 78.2330017;
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat6.z = u_xlat30 * 2.0 + -1.0;
					        u_xlat30 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = u_xlat30 * 6.28318548;
					        u_xlat7 = sin(u_xlat30);
					        u_xlat8.x = cos(u_xlat30);
					        u_xlat30 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat30) * u_xlat8.xy;
					        u_xlat30 = u_xlat4.y + 1.0;
					        u_xlat30 = u_xlat30 * 0.200000003;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat30 = u_xlat30 * _Radius;
					        u_xlat13.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot((-u_xlat0.xyz), u_xlat13.xyz);
					        u_xlatb30 = u_xlat30>=0.0;
					        u_xlat13.xyz = (bool(u_xlatb30)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat1.xyz * vec3(u_xlat27) + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat30 = texture2D(_CameraDepthTexture, u_xlat6.xy).x;
					        u_xlat31 = _ZBufferParams.z * u_xlat30 + _ZBufferParams.w;
					        u_xlat31 = float(1.0) / u_xlat31;
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb32 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati32 = u_xlatb32 ? 1 : int(0);
					        u_xlatb6.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlatb6.x = u_xlatb6.y || u_xlatb6.x;
					        u_xlati6 = u_xlatb6.x ? 1 : int(0);
					        u_xlati32 = u_xlati32 + u_xlati6;
					        u_xlat32 = float(u_xlati32);
					        u_xlatb30 = u_xlat30>=0.999989986;
					        u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
					        u_xlat30 = u_xlat30 + u_xlat32;
					        u_xlat30 = u_xlat30 * 100000000.0 + u_xlat31;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat30) + (-u_xlat3.xyz);
					        u_xlat30 = dot(u_xlat13.xyz, u_xlat0.xyz);
					        u_xlat30 = (-u_xlat27) * 0.00200000009 + u_xlat30;
					        u_xlat30 = max(u_xlat30, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat30 = u_xlat30 / u_xlat13.x;
					        u_xlat20.x = u_xlat20.x + u_xlat30;
					    }
					    u_xlat0.x = u_xlat20.x * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x * 0.200000003;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					uniform lowp sampler2D _CameraDepthNormalsTexture;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					int u_xlati6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					float u_xlat10;
					ivec2 u_xlati10;
					bvec2 u_xlatb10;
					vec3 u_xlat13;
					mediump float u_xlat16_18;
					bvec2 u_xlatb19;
					vec2 u_xlat20;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					int u_xlati29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					int u_xlati32;
					bool u_xlatb32;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
					ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
					ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
					ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_18 = 2.0 / u_xlat16_18;
					    u_xlat1.xy = u_xlat16_0.xy * vec2(u_xlat16_18);
					    u_xlat1.z = u_xlat16_18 + -1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat27 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat27 + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlatb10.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati10.x = op_or((int(u_xlatb10.y) * -1), (int(u_xlatb10.x) * -1));
					    u_xlatb19.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati10.y = op_or((int(u_xlatb19.y) * -1), (int(u_xlatb19.x) * -1));
					    u_xlati10.xy = op_and(u_xlati10.xy, ivec2(1, 1));
					    u_xlati10.x = u_xlati10.y + u_xlati10.x;
					    u_xlat10 = float(u_xlati10.x);
					    u_xlatb27 = u_xlat27>=0.999989986;
					    u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					    u_xlat27 = u_xlat27 + u_xlat10;
					    u_xlat27 = u_xlat27 * 100000000.0 + u_xlat1.x;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat16_1.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.z = 1.0;
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat28 = fract(u_xlat28);
					    u_xlat28 = u_xlat28 * 52.9829178;
					    u_xlat28 = fract(u_xlat28);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat20.x = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<5 ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat30 = u_xlat4.y * 78.2330017;
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat6.z = u_xlat30 * 2.0 + -1.0;
					        u_xlat30 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = u_xlat30 * 6.28318548;
					        u_xlat7 = sin(u_xlat30);
					        u_xlat8.x = cos(u_xlat30);
					        u_xlat30 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat30) * u_xlat8.xy;
					        u_xlat30 = u_xlat4.y + 1.0;
					        u_xlat30 = u_xlat30 * 0.200000003;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat30 = u_xlat30 * _Radius;
					        u_xlat13.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot((-u_xlat0.xyz), u_xlat13.xyz);
					        u_xlatb30 = u_xlat30>=0.0;
					        u_xlat13.xyz = (bool(u_xlatb30)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat1.xyz * vec3(u_xlat27) + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat30 = texture2D(_CameraDepthTexture, u_xlat6.xy).x;
					        u_xlat31 = _ZBufferParams.z * u_xlat30 + _ZBufferParams.w;
					        u_xlat31 = float(1.0) / u_xlat31;
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb32 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati32 = u_xlatb32 ? 1 : int(0);
					        u_xlatb6.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlatb6.x = u_xlatb6.y || u_xlatb6.x;
					        u_xlati6 = u_xlatb6.x ? 1 : int(0);
					        u_xlati32 = u_xlati32 + u_xlati6;
					        u_xlat32 = float(u_xlati32);
					        u_xlatb30 = u_xlat30>=0.999989986;
					        u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
					        u_xlat30 = u_xlat30 + u_xlat32;
					        u_xlat30 = u_xlat30 * 100000000.0 + u_xlat31;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat30) + (-u_xlat3.xyz);
					        u_xlat30 = dot(u_xlat13.xyz, u_xlat0.xyz);
					        u_xlat30 = (-u_xlat27) * 0.00200000009 + u_xlat30;
					        u_xlat30 = max(u_xlat30, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat30 = u_xlat30 / u_xlat13.x;
					        u_xlat20.x = u_xlat20.x + u_xlat30;
					    }
					    u_xlat0.x = u_xlat20.x * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x * 0.200000003;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	int _SampleCount;
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraDepthNormalsTexture;
					UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					ivec2 u_xlati6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					float u_xlat10;
					ivec2 u_xlati10;
					bvec2 u_xlatb10;
					vec3 u_xlat13;
					bvec2 u_xlatb15;
					mediump float u_xlat16_18;
					bvec2 u_xlatb19;
					vec2 u_xlat20;
					float u_xlat22;
					bool u_xlatb22;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					float u_xlat29;
					int u_xlati30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					bool u_xlatb32;
					void main()
					{
					    u_xlat16_0.xyz = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_18 = 2.0 / u_xlat16_18;
					    u_xlat1.xy = u_xlat16_0.xy * vec2(u_xlat16_18);
					    u_xlat1.z = u_xlat16_18 + -1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat27 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat27 + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlatb10.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati10.x = int(uint((uint(u_xlatb10.y) * 0xffffffffu) | (uint(u_xlatb10.x) * 0xffffffffu)));
					    u_xlatb19.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati10.y = int(uint((uint(u_xlatb19.y) * 0xffffffffu) | (uint(u_xlatb19.x) * 0xffffffffu)));
					    u_xlati10.xy = ivec2(uvec2(uint(u_xlati10.x) & uint(1u), uint(u_xlati10.y) & uint(1u)));
					    u_xlati10.x = u_xlati10.y + u_xlati10.x;
					    u_xlat10 = float(u_xlati10.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb27 = !!(u_xlat27>=0.999989986);
					#else
					    u_xlatb27 = u_xlat27>=0.999989986;
					#endif
					    u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					    u_xlat27 = u_xlat27 + u_xlat10;
					    u_xlat27 = u_xlat27 * 100000000.0 + u_xlat1.x;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat16_1.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.z = 1.0;
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat28 = fract(u_xlat28);
					    u_xlat28 = u_xlat28 * 52.9829178;
					    u_xlat28 = fract(u_xlat28);
					    u_xlat20.x = float(_SampleCount);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat29 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat22 = u_xlat4.y * 78.2330017;
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat6.z = u_xlat22 * 2.0 + -1.0;
					        u_xlat22 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = u_xlat22 * 6.28318548;
					        u_xlat7 = sin(u_xlat22);
					        u_xlat8.x = cos(u_xlat22);
					        u_xlat22 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat22 = sqrt(u_xlat22);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat22) * u_xlat8.xy;
					        u_xlat13.x = u_xlat4.y + 1.0;
					        u_xlat13.x = u_xlat13.x / u_xlat20.x;
					        u_xlat13.x = sqrt(u_xlat13.x);
					        u_xlat13.x = u_xlat13.x * _Radius;
					        u_xlat13.xyz = u_xlat13.xxx * u_xlat6.xyz;
					        u_xlat32 = dot((-u_xlat0.xyz), u_xlat13.xyz);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb32 = !!(u_xlat32>=0.0);
					#else
					        u_xlatb32 = u_xlat32>=0.0;
					#endif
					        u_xlat13.xyz = (bool(u_xlatb32)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat1.xyz * vec3(u_xlat27) + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat31 = texture(_CameraDepthTexture, u_xlat6.xy).x;
					        u_xlat32 = _ZBufferParams.z * u_xlat31 + _ZBufferParams.w;
					        u_xlat32 = float(1.0) / u_xlat32;
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlati6.x = int(uint((uint(u_xlatb6.y) * 0xffffffffu) | (uint(u_xlatb6.x) * 0xffffffffu)));
					        u_xlatb15.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlati6.y = int(uint((uint(u_xlatb15.y) * 0xffffffffu) | (uint(u_xlatb15.x) * 0xffffffffu)));
					        u_xlati6.xy = ivec2(uvec2(uint(u_xlati6.x) & uint(1u), uint(u_xlati6.y) & uint(1u)));
					        u_xlati6.x = u_xlati6.y + u_xlati6.x;
					        u_xlat6.x = float(u_xlati6.x);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb31 = !!(u_xlat31>=0.999989986);
					#else
					        u_xlatb31 = u_xlat31>=0.999989986;
					#endif
					        u_xlat31 = u_xlatb31 ? 1.0 : float(0.0);
					        u_xlat31 = u_xlat31 + u_xlat6.x;
					        u_xlat31 = u_xlat31 * 100000000.0 + u_xlat32;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat31) + (-u_xlat3.xyz);
					        u_xlat5.x = dot(u_xlat13.xyz, u_xlat0.xyz);
					        u_xlat5.x = (-u_xlat27) * 0.00200000009 + u_xlat5.x;
					        u_xlat5.x = max(u_xlat5.x, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat13.x = u_xlat5.x / u_xlat13.x;
					        u_xlat29 = u_xlat29 + u_xlat13.x;
					    }
					    u_xlat0.x = u_xlat29 * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x / u_xlat20.x;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	int _SampleCount;
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraDepthNormalsTexture;
					UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					ivec2 u_xlati6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					float u_xlat10;
					ivec2 u_xlati10;
					bvec2 u_xlatb10;
					vec3 u_xlat13;
					bvec2 u_xlatb15;
					mediump float u_xlat16_18;
					bvec2 u_xlatb19;
					vec2 u_xlat20;
					float u_xlat22;
					bool u_xlatb22;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					float u_xlat29;
					int u_xlati30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					bool u_xlatb32;
					void main()
					{
					    u_xlat16_0.xyz = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_18 = 2.0 / u_xlat16_18;
					    u_xlat1.xy = u_xlat16_0.xy * vec2(u_xlat16_18);
					    u_xlat1.z = u_xlat16_18 + -1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat27 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat27 + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlatb10.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati10.x = int(uint((uint(u_xlatb10.y) * 0xffffffffu) | (uint(u_xlatb10.x) * 0xffffffffu)));
					    u_xlatb19.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati10.y = int(uint((uint(u_xlatb19.y) * 0xffffffffu) | (uint(u_xlatb19.x) * 0xffffffffu)));
					    u_xlati10.xy = ivec2(uvec2(uint(u_xlati10.x) & uint(1u), uint(u_xlati10.y) & uint(1u)));
					    u_xlati10.x = u_xlati10.y + u_xlati10.x;
					    u_xlat10 = float(u_xlati10.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb27 = !!(u_xlat27>=0.999989986);
					#else
					    u_xlatb27 = u_xlat27>=0.999989986;
					#endif
					    u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					    u_xlat27 = u_xlat27 + u_xlat10;
					    u_xlat27 = u_xlat27 * 100000000.0 + u_xlat1.x;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat16_1.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.z = 1.0;
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat28 = fract(u_xlat28);
					    u_xlat28 = u_xlat28 * 52.9829178;
					    u_xlat28 = fract(u_xlat28);
					    u_xlat20.x = float(_SampleCount);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat29 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat22 = u_xlat4.y * 78.2330017;
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat6.z = u_xlat22 * 2.0 + -1.0;
					        u_xlat22 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = u_xlat22 * 6.28318548;
					        u_xlat7 = sin(u_xlat22);
					        u_xlat8.x = cos(u_xlat22);
					        u_xlat22 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat22 = sqrt(u_xlat22);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat22) * u_xlat8.xy;
					        u_xlat13.x = u_xlat4.y + 1.0;
					        u_xlat13.x = u_xlat13.x / u_xlat20.x;
					        u_xlat13.x = sqrt(u_xlat13.x);
					        u_xlat13.x = u_xlat13.x * _Radius;
					        u_xlat13.xyz = u_xlat13.xxx * u_xlat6.xyz;
					        u_xlat32 = dot((-u_xlat0.xyz), u_xlat13.xyz);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb32 = !!(u_xlat32>=0.0);
					#else
					        u_xlatb32 = u_xlat32>=0.0;
					#endif
					        u_xlat13.xyz = (bool(u_xlatb32)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat1.xyz * vec3(u_xlat27) + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat31 = texture(_CameraDepthTexture, u_xlat6.xy).x;
					        u_xlat32 = _ZBufferParams.z * u_xlat31 + _ZBufferParams.w;
					        u_xlat32 = float(1.0) / u_xlat32;
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlati6.x = int(uint((uint(u_xlatb6.y) * 0xffffffffu) | (uint(u_xlatb6.x) * 0xffffffffu)));
					        u_xlatb15.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlati6.y = int(uint((uint(u_xlatb15.y) * 0xffffffffu) | (uint(u_xlatb15.x) * 0xffffffffu)));
					        u_xlati6.xy = ivec2(uvec2(uint(u_xlati6.x) & uint(1u), uint(u_xlati6.y) & uint(1u)));
					        u_xlati6.x = u_xlati6.y + u_xlati6.x;
					        u_xlat6.x = float(u_xlati6.x);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb31 = !!(u_xlat31>=0.999989986);
					#else
					        u_xlatb31 = u_xlat31>=0.999989986;
					#endif
					        u_xlat31 = u_xlatb31 ? 1.0 : float(0.0);
					        u_xlat31 = u_xlat31 + u_xlat6.x;
					        u_xlat31 = u_xlat31 * 100000000.0 + u_xlat32;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat31) + (-u_xlat3.xyz);
					        u_xlat5.x = dot(u_xlat13.xyz, u_xlat0.xyz);
					        u_xlat5.x = (-u_xlat27) * 0.00200000009 + u_xlat5.x;
					        u_xlat5.x = max(u_xlat5.x, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat13.x = u_xlat5.x / u_xlat13.x;
					        u_xlat29 = u_xlat29 + u_xlat13.x;
					    }
					    u_xlat0.x = u_xlat29 * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x / u_xlat20.x;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	int _SampleCount;
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraDepthNormalsTexture;
					UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					ivec2 u_xlati6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					float u_xlat10;
					ivec2 u_xlati10;
					bvec2 u_xlatb10;
					vec3 u_xlat13;
					bvec2 u_xlatb15;
					mediump float u_xlat16_18;
					bvec2 u_xlatb19;
					vec2 u_xlat20;
					float u_xlat22;
					bool u_xlatb22;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					float u_xlat29;
					int u_xlati30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					bool u_xlatb32;
					void main()
					{
					    u_xlat16_0.xyz = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_18 = 2.0 / u_xlat16_18;
					    u_xlat1.xy = u_xlat16_0.xy * vec2(u_xlat16_18);
					    u_xlat1.z = u_xlat16_18 + -1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat27 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat27 + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlatb10.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati10.x = int(uint((uint(u_xlatb10.y) * 0xffffffffu) | (uint(u_xlatb10.x) * 0xffffffffu)));
					    u_xlatb19.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati10.y = int(uint((uint(u_xlatb19.y) * 0xffffffffu) | (uint(u_xlatb19.x) * 0xffffffffu)));
					    u_xlati10.xy = ivec2(uvec2(uint(u_xlati10.x) & uint(1u), uint(u_xlati10.y) & uint(1u)));
					    u_xlati10.x = u_xlati10.y + u_xlati10.x;
					    u_xlat10 = float(u_xlati10.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb27 = !!(u_xlat27>=0.999989986);
					#else
					    u_xlatb27 = u_xlat27>=0.999989986;
					#endif
					    u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					    u_xlat27 = u_xlat27 + u_xlat10;
					    u_xlat27 = u_xlat27 * 100000000.0 + u_xlat1.x;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat16_1.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.z = 1.0;
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat28 = fract(u_xlat28);
					    u_xlat28 = u_xlat28 * 52.9829178;
					    u_xlat28 = fract(u_xlat28);
					    u_xlat20.x = float(_SampleCount);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat29 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat22 = u_xlat4.y * 78.2330017;
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat6.z = u_xlat22 * 2.0 + -1.0;
					        u_xlat22 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = u_xlat22 * 6.28318548;
					        u_xlat7 = sin(u_xlat22);
					        u_xlat8.x = cos(u_xlat22);
					        u_xlat22 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat22 = sqrt(u_xlat22);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat22) * u_xlat8.xy;
					        u_xlat13.x = u_xlat4.y + 1.0;
					        u_xlat13.x = u_xlat13.x / u_xlat20.x;
					        u_xlat13.x = sqrt(u_xlat13.x);
					        u_xlat13.x = u_xlat13.x * _Radius;
					        u_xlat13.xyz = u_xlat13.xxx * u_xlat6.xyz;
					        u_xlat32 = dot((-u_xlat0.xyz), u_xlat13.xyz);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb32 = !!(u_xlat32>=0.0);
					#else
					        u_xlatb32 = u_xlat32>=0.0;
					#endif
					        u_xlat13.xyz = (bool(u_xlatb32)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat1.xyz * vec3(u_xlat27) + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat31 = texture(_CameraDepthTexture, u_xlat6.xy).x;
					        u_xlat32 = _ZBufferParams.z * u_xlat31 + _ZBufferParams.w;
					        u_xlat32 = float(1.0) / u_xlat32;
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlati6.x = int(uint((uint(u_xlatb6.y) * 0xffffffffu) | (uint(u_xlatb6.x) * 0xffffffffu)));
					        u_xlatb15.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlati6.y = int(uint((uint(u_xlatb15.y) * 0xffffffffu) | (uint(u_xlatb15.x) * 0xffffffffu)));
					        u_xlati6.xy = ivec2(uvec2(uint(u_xlati6.x) & uint(1u), uint(u_xlati6.y) & uint(1u)));
					        u_xlati6.x = u_xlati6.y + u_xlati6.x;
					        u_xlat6.x = float(u_xlati6.x);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb31 = !!(u_xlat31>=0.999989986);
					#else
					        u_xlatb31 = u_xlat31>=0.999989986;
					#endif
					        u_xlat31 = u_xlatb31 ? 1.0 : float(0.0);
					        u_xlat31 = u_xlat31 + u_xlat6.x;
					        u_xlat31 = u_xlat31 * 100000000.0 + u_xlat32;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat31) + (-u_xlat3.xyz);
					        u_xlat5.x = dot(u_xlat13.xyz, u_xlat0.xyz);
					        u_xlat5.x = (-u_xlat27) * 0.00200000009 + u_xlat5.x;
					        u_xlat5.x = max(u_xlat5.x, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat13.x = u_xlat5.x / u_xlat13.x;
					        u_xlat29 = u_xlat29 + u_xlat13.x;
					    }
					    u_xlat0.x = u_xlat29 * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x / u_xlat20.x;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 71241
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
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					uniform lowp sampler2D _CameraDepthNormalsTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					lowp vec2 u_xlat10_6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					vec3 u_xlat9;
					mediump vec2 u_xlat16_9;
					ivec2 u_xlati9;
					bvec2 u_xlatb9;
					vec3 u_xlat13;
					float u_xlat18;
					bvec2 u_xlatb18;
					vec2 u_xlat20;
					float u_xlat28;
					int u_xlati29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					int u_xlati31;
					bool u_xlatb31;
					float u_xlat32;
					int u_xlati32;
					bool u_xlatb32;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
					ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
					ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
					ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat10_0 = texture2D(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_0 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					    u_xlat16_0 = 2.0 / u_xlat16_0;
					    u_xlat1.xy = u_xlat16_1.xy * vec2(u_xlat16_0);
					    u_xlat1.z = u_xlat16_0 + -1.0;
					    u_xlat0.x = dot(u_xlat10_0.zw, vec2(1.0, 0.00392156886));
					    u_xlatb9.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati9.x = op_or((int(u_xlatb9.y) * -1), (int(u_xlatb9.x) * -1));
					    u_xlatb18.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati9.y = op_or((int(u_xlatb18.y) * -1), (int(u_xlatb18.x) * -1));
					    u_xlati9.xy = op_and(u_xlati9.xy, ivec2(1, 1));
					    u_xlati9.x = u_xlati9.y + u_xlati9.x;
					    u_xlat9.x = float(u_xlati9.x);
					    u_xlatb18.x = u_xlat0.x>=0.999989986;
					    u_xlat18 = u_xlatb18.x ? 1.0 : float(0.0);
					    u_xlat9.x = u_xlat18 + u_xlat9.x;
					    u_xlat9.x = u_xlat9.x * 100000000.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z + u_xlat9.x;
					    u_xlat0.x = (-_ProjectionParams.z) * 1.52587891e-05 + u_xlat0.x;
					    u_xlat16_9.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat9.xy = u_xlat16_9.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat3.xy = u_xlat9.xy / u_xlat2.xy;
					    u_xlat3.z = 1.0;
					    u_xlat9.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat1.w = fract(u_xlat28);
					    u_xlat1 = u_xlat1 * vec4(1.0, 1.0, -1.0, 52.9829178);
					    u_xlat28 = fract(u_xlat1.w);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat20.x = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<5 ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat30 = u_xlat4.y * 78.2330017;
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat6.z = u_xlat30 * 2.0 + -1.0;
					        u_xlat30 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = u_xlat30 * 6.28318548;
					        u_xlat7 = sin(u_xlat30);
					        u_xlat8.x = cos(u_xlat30);
					        u_xlat30 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat30) * u_xlat8.xy;
					        u_xlat30 = u_xlat4.y + 1.0;
					        u_xlat30 = u_xlat30 * 0.200000003;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat30 = u_xlat30 * _Radius;
					        u_xlat13.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot((-u_xlat1.xyz), u_xlat13.xyz);
					        u_xlatb30 = u_xlat30>=0.0;
					        u_xlat13.xyz = (bool(u_xlatb30)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat3.xyz * u_xlat0.xxx + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat10_6.xy = texture2D(_CameraDepthNormalsTexture, u_xlat6.xy).zw;
					        u_xlat30 = dot(u_xlat10_6.xy, vec2(1.0, 0.00392156886));
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb31 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati31 = u_xlatb31 ? 1 : int(0);
					        u_xlatb6.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlatb32 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati32 = u_xlatb32 ? 1 : int(0);
					        u_xlati31 = u_xlati31 + u_xlati32;
					        u_xlat31 = float(u_xlati31);
					        u_xlatb32 = u_xlat30>=0.999989986;
					        u_xlat32 = u_xlatb32 ? 1.0 : float(0.0);
					        u_xlat31 = u_xlat31 + u_xlat32;
					        u_xlat31 = u_xlat31 * 100000000.0;
					        u_xlat30 = u_xlat30 * _ProjectionParams.z + u_xlat31;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat30) + (-u_xlat9.xyz);
					        u_xlat30 = dot(u_xlat13.xyz, u_xlat1.xyz);
					        u_xlat30 = (-u_xlat0.x) * 0.00200000009 + u_xlat30;
					        u_xlat30 = max(u_xlat30, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat30 = u_xlat30 / u_xlat13.x;
					        u_xlat20.x = u_xlat20.x + u_xlat30;
					    }
					    u_xlat0.x = u_xlat20.x * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x * 0.200000003;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					uniform lowp sampler2D _CameraDepthNormalsTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					lowp vec2 u_xlat10_6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					vec3 u_xlat9;
					mediump vec2 u_xlat16_9;
					ivec2 u_xlati9;
					bvec2 u_xlatb9;
					vec3 u_xlat13;
					float u_xlat18;
					bvec2 u_xlatb18;
					vec2 u_xlat20;
					float u_xlat28;
					int u_xlati29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					int u_xlati31;
					bool u_xlatb31;
					float u_xlat32;
					int u_xlati32;
					bool u_xlatb32;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
					ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
					ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
					ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat10_0 = texture2D(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_0 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					    u_xlat16_0 = 2.0 / u_xlat16_0;
					    u_xlat1.xy = u_xlat16_1.xy * vec2(u_xlat16_0);
					    u_xlat1.z = u_xlat16_0 + -1.0;
					    u_xlat0.x = dot(u_xlat10_0.zw, vec2(1.0, 0.00392156886));
					    u_xlatb9.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati9.x = op_or((int(u_xlatb9.y) * -1), (int(u_xlatb9.x) * -1));
					    u_xlatb18.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati9.y = op_or((int(u_xlatb18.y) * -1), (int(u_xlatb18.x) * -1));
					    u_xlati9.xy = op_and(u_xlati9.xy, ivec2(1, 1));
					    u_xlati9.x = u_xlati9.y + u_xlati9.x;
					    u_xlat9.x = float(u_xlati9.x);
					    u_xlatb18.x = u_xlat0.x>=0.999989986;
					    u_xlat18 = u_xlatb18.x ? 1.0 : float(0.0);
					    u_xlat9.x = u_xlat18 + u_xlat9.x;
					    u_xlat9.x = u_xlat9.x * 100000000.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z + u_xlat9.x;
					    u_xlat0.x = (-_ProjectionParams.z) * 1.52587891e-05 + u_xlat0.x;
					    u_xlat16_9.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat9.xy = u_xlat16_9.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat3.xy = u_xlat9.xy / u_xlat2.xy;
					    u_xlat3.z = 1.0;
					    u_xlat9.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat1.w = fract(u_xlat28);
					    u_xlat1 = u_xlat1 * vec4(1.0, 1.0, -1.0, 52.9829178);
					    u_xlat28 = fract(u_xlat1.w);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat20.x = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<5 ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat30 = u_xlat4.y * 78.2330017;
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat6.z = u_xlat30 * 2.0 + -1.0;
					        u_xlat30 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = u_xlat30 * 6.28318548;
					        u_xlat7 = sin(u_xlat30);
					        u_xlat8.x = cos(u_xlat30);
					        u_xlat30 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat30) * u_xlat8.xy;
					        u_xlat30 = u_xlat4.y + 1.0;
					        u_xlat30 = u_xlat30 * 0.200000003;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat30 = u_xlat30 * _Radius;
					        u_xlat13.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot((-u_xlat1.xyz), u_xlat13.xyz);
					        u_xlatb30 = u_xlat30>=0.0;
					        u_xlat13.xyz = (bool(u_xlatb30)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat3.xyz * u_xlat0.xxx + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat10_6.xy = texture2D(_CameraDepthNormalsTexture, u_xlat6.xy).zw;
					        u_xlat30 = dot(u_xlat10_6.xy, vec2(1.0, 0.00392156886));
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb31 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati31 = u_xlatb31 ? 1 : int(0);
					        u_xlatb6.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlatb32 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati32 = u_xlatb32 ? 1 : int(0);
					        u_xlati31 = u_xlati31 + u_xlati32;
					        u_xlat31 = float(u_xlati31);
					        u_xlatb32 = u_xlat30>=0.999989986;
					        u_xlat32 = u_xlatb32 ? 1.0 : float(0.0);
					        u_xlat31 = u_xlat31 + u_xlat32;
					        u_xlat31 = u_xlat31 * 100000000.0;
					        u_xlat30 = u_xlat30 * _ProjectionParams.z + u_xlat31;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat30) + (-u_xlat9.xyz);
					        u_xlat30 = dot(u_xlat13.xyz, u_xlat1.xyz);
					        u_xlat30 = (-u_xlat0.x) * 0.00200000009 + u_xlat30;
					        u_xlat30 = max(u_xlat30, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat30 = u_xlat30 / u_xlat13.x;
					        u_xlat20.x = u_xlat20.x + u_xlat30;
					    }
					    u_xlat0.x = u_xlat20.x * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x * 0.200000003;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					uniform lowp sampler2D _CameraDepthNormalsTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					lowp vec2 u_xlat10_6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					vec3 u_xlat9;
					mediump vec2 u_xlat16_9;
					ivec2 u_xlati9;
					bvec2 u_xlatb9;
					vec3 u_xlat13;
					float u_xlat18;
					bvec2 u_xlatb18;
					vec2 u_xlat20;
					float u_xlat28;
					int u_xlati29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					int u_xlati31;
					bool u_xlatb31;
					float u_xlat32;
					int u_xlati32;
					bool u_xlatb32;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
					ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
					ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
					ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat10_0 = texture2D(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_0 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					    u_xlat16_0 = 2.0 / u_xlat16_0;
					    u_xlat1.xy = u_xlat16_1.xy * vec2(u_xlat16_0);
					    u_xlat1.z = u_xlat16_0 + -1.0;
					    u_xlat0.x = dot(u_xlat10_0.zw, vec2(1.0, 0.00392156886));
					    u_xlatb9.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati9.x = op_or((int(u_xlatb9.y) * -1), (int(u_xlatb9.x) * -1));
					    u_xlatb18.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati9.y = op_or((int(u_xlatb18.y) * -1), (int(u_xlatb18.x) * -1));
					    u_xlati9.xy = op_and(u_xlati9.xy, ivec2(1, 1));
					    u_xlati9.x = u_xlati9.y + u_xlati9.x;
					    u_xlat9.x = float(u_xlati9.x);
					    u_xlatb18.x = u_xlat0.x>=0.999989986;
					    u_xlat18 = u_xlatb18.x ? 1.0 : float(0.0);
					    u_xlat9.x = u_xlat18 + u_xlat9.x;
					    u_xlat9.x = u_xlat9.x * 100000000.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z + u_xlat9.x;
					    u_xlat0.x = (-_ProjectionParams.z) * 1.52587891e-05 + u_xlat0.x;
					    u_xlat16_9.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat9.xy = u_xlat16_9.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat3.xy = u_xlat9.xy / u_xlat2.xy;
					    u_xlat3.z = 1.0;
					    u_xlat9.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat1.w = fract(u_xlat28);
					    u_xlat1 = u_xlat1 * vec4(1.0, 1.0, -1.0, 52.9829178);
					    u_xlat28 = fract(u_xlat1.w);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat20.x = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<5 ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat30 = u_xlat4.y * 78.2330017;
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat6.z = u_xlat30 * 2.0 + -1.0;
					        u_xlat30 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = u_xlat30 * 6.28318548;
					        u_xlat7 = sin(u_xlat30);
					        u_xlat8.x = cos(u_xlat30);
					        u_xlat30 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat30) * u_xlat8.xy;
					        u_xlat30 = u_xlat4.y + 1.0;
					        u_xlat30 = u_xlat30 * 0.200000003;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat30 = u_xlat30 * _Radius;
					        u_xlat13.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot((-u_xlat1.xyz), u_xlat13.xyz);
					        u_xlatb30 = u_xlat30>=0.0;
					        u_xlat13.xyz = (bool(u_xlatb30)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat3.xyz * u_xlat0.xxx + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat10_6.xy = texture2D(_CameraDepthNormalsTexture, u_xlat6.xy).zw;
					        u_xlat30 = dot(u_xlat10_6.xy, vec2(1.0, 0.00392156886));
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb31 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati31 = u_xlatb31 ? 1 : int(0);
					        u_xlatb6.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlatb32 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati32 = u_xlatb32 ? 1 : int(0);
					        u_xlati31 = u_xlati31 + u_xlati32;
					        u_xlat31 = float(u_xlati31);
					        u_xlatb32 = u_xlat30>=0.999989986;
					        u_xlat32 = u_xlatb32 ? 1.0 : float(0.0);
					        u_xlat31 = u_xlat31 + u_xlat32;
					        u_xlat31 = u_xlat31 * 100000000.0;
					        u_xlat30 = u_xlat30 * _ProjectionParams.z + u_xlat31;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat30) + (-u_xlat9.xyz);
					        u_xlat30 = dot(u_xlat13.xyz, u_xlat1.xyz);
					        u_xlat30 = (-u_xlat0.x) * 0.00200000009 + u_xlat30;
					        u_xlat30 = max(u_xlat30, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat30 = u_xlat30 / u_xlat13.x;
					        u_xlat20.x = u_xlat20.x + u_xlat30;
					    }
					    u_xlat0.x = u_xlat20.x * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x * 0.200000003;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	int _SampleCount;
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraDepthNormalsTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					mediump vec2 u_xlat16_6;
					int u_xlati6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					vec3 u_xlat9;
					mediump vec2 u_xlat16_9;
					ivec2 u_xlati9;
					bvec2 u_xlatb9;
					vec3 u_xlat13;
					float u_xlat18;
					bvec2 u_xlatb18;
					vec2 u_xlat20;
					float u_xlat22;
					bool u_xlatb22;
					float u_xlat28;
					float u_xlat29;
					int u_xlati30;
					float u_xlat31;
					float u_xlat32;
					int u_xlati32;
					bool u_xlatb32;
					void main()
					{
					    u_xlat16_0 = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_0.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					    u_xlat16_0.x = 2.0 / u_xlat16_0.x;
					    u_xlat1.xy = u_xlat16_1.xy * u_xlat16_0.xx;
					    u_xlat1.z = u_xlat16_0.x + -1.0;
					    u_xlat0.x = dot(u_xlat16_0.zw, vec2(1.0, 0.00392156886));
					    u_xlatb9.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati9.x = int(uint((uint(u_xlatb9.y) * 0xffffffffu) | (uint(u_xlatb9.x) * 0xffffffffu)));
					    u_xlatb18.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati9.y = int(uint((uint(u_xlatb18.y) * 0xffffffffu) | (uint(u_xlatb18.x) * 0xffffffffu)));
					    u_xlati9.xy = ivec2(uvec2(uint(u_xlati9.x) & uint(1u), uint(u_xlati9.y) & uint(1u)));
					    u_xlati9.x = u_xlati9.y + u_xlati9.x;
					    u_xlat9.x = float(u_xlati9.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18.x = !!(u_xlat0.x>=0.999989986);
					#else
					    u_xlatb18.x = u_xlat0.x>=0.999989986;
					#endif
					    u_xlat18 = u_xlatb18.x ? 1.0 : float(0.0);
					    u_xlat9.x = u_xlat18 + u_xlat9.x;
					    u_xlat9.x = u_xlat9.x * 100000000.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z + u_xlat9.x;
					    u_xlat0.x = (-_ProjectionParams.z) * 1.52587891e-05 + u_xlat0.x;
					    u_xlat16_9.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat9.xy = u_xlat16_9.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat3.xy = u_xlat9.xy / u_xlat2.xy;
					    u_xlat3.z = 1.0;
					    u_xlat9.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat1.w = fract(u_xlat28);
					    u_xlat1 = u_xlat1 * vec4(1.0, 1.0, -1.0, 52.9829178);
					    u_xlat28 = fract(u_xlat1.w);
					    u_xlat20.x = float(_SampleCount);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat29 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat22 = u_xlat4.y * 78.2330017;
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat6.z = u_xlat22 * 2.0 + -1.0;
					        u_xlat22 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = u_xlat22 * 6.28318548;
					        u_xlat7 = sin(u_xlat22);
					        u_xlat8.x = cos(u_xlat22);
					        u_xlat22 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat22 = sqrt(u_xlat22);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat22) * u_xlat8.xy;
					        u_xlat13.x = u_xlat4.y + 1.0;
					        u_xlat13.x = u_xlat13.x / u_xlat20.x;
					        u_xlat13.x = sqrt(u_xlat13.x);
					        u_xlat13.x = u_xlat13.x * _Radius;
					        u_xlat13.xyz = u_xlat13.xxx * u_xlat6.xyz;
					        u_xlat32 = dot((-u_xlat1.xyz), u_xlat13.xyz);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb32 = !!(u_xlat32>=0.0);
					#else
					        u_xlatb32 = u_xlat32>=0.0;
					#endif
					        u_xlat13.xyz = (bool(u_xlatb32)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat3.xyz * u_xlat0.xxx + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat16_6.xy = texture(_CameraDepthNormalsTexture, u_xlat6.xy).zw;
					        u_xlat31 = dot(u_xlat16_6.xy, vec2(1.0, 0.00392156886));
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb32 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati32 = u_xlatb32 ? 1 : int(0);
					        u_xlatb6.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlatb6.x = u_xlatb6.y || u_xlatb6.x;
					        u_xlati6 = u_xlatb6.x ? 1 : int(0);
					        u_xlati32 = u_xlati32 + u_xlati6;
					        u_xlat32 = float(u_xlati32);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb6.x = !!(u_xlat31>=0.999989986);
					#else
					        u_xlatb6.x = u_xlat31>=0.999989986;
					#endif
					        u_xlat6.x = u_xlatb6.x ? 1.0 : float(0.0);
					        u_xlat32 = u_xlat32 + u_xlat6.x;
					        u_xlat32 = u_xlat32 * 100000000.0;
					        u_xlat31 = u_xlat31 * _ProjectionParams.z + u_xlat32;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat31) + (-u_xlat9.xyz);
					        u_xlat5.x = dot(u_xlat13.xyz, u_xlat1.xyz);
					        u_xlat5.x = (-u_xlat0.x) * 0.00200000009 + u_xlat5.x;
					        u_xlat5.x = max(u_xlat5.x, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat13.x = u_xlat5.x / u_xlat13.x;
					        u_xlat29 = u_xlat29 + u_xlat13.x;
					    }
					    u_xlat0.x = u_xlat29 * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x / u_xlat20.x;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	int _SampleCount;
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraDepthNormalsTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					mediump vec2 u_xlat16_6;
					int u_xlati6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					vec3 u_xlat9;
					mediump vec2 u_xlat16_9;
					ivec2 u_xlati9;
					bvec2 u_xlatb9;
					vec3 u_xlat13;
					float u_xlat18;
					bvec2 u_xlatb18;
					vec2 u_xlat20;
					float u_xlat22;
					bool u_xlatb22;
					float u_xlat28;
					float u_xlat29;
					int u_xlati30;
					float u_xlat31;
					float u_xlat32;
					int u_xlati32;
					bool u_xlatb32;
					void main()
					{
					    u_xlat16_0 = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_0.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					    u_xlat16_0.x = 2.0 / u_xlat16_0.x;
					    u_xlat1.xy = u_xlat16_1.xy * u_xlat16_0.xx;
					    u_xlat1.z = u_xlat16_0.x + -1.0;
					    u_xlat0.x = dot(u_xlat16_0.zw, vec2(1.0, 0.00392156886));
					    u_xlatb9.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati9.x = int(uint((uint(u_xlatb9.y) * 0xffffffffu) | (uint(u_xlatb9.x) * 0xffffffffu)));
					    u_xlatb18.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati9.y = int(uint((uint(u_xlatb18.y) * 0xffffffffu) | (uint(u_xlatb18.x) * 0xffffffffu)));
					    u_xlati9.xy = ivec2(uvec2(uint(u_xlati9.x) & uint(1u), uint(u_xlati9.y) & uint(1u)));
					    u_xlati9.x = u_xlati9.y + u_xlati9.x;
					    u_xlat9.x = float(u_xlati9.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18.x = !!(u_xlat0.x>=0.999989986);
					#else
					    u_xlatb18.x = u_xlat0.x>=0.999989986;
					#endif
					    u_xlat18 = u_xlatb18.x ? 1.0 : float(0.0);
					    u_xlat9.x = u_xlat18 + u_xlat9.x;
					    u_xlat9.x = u_xlat9.x * 100000000.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z + u_xlat9.x;
					    u_xlat0.x = (-_ProjectionParams.z) * 1.52587891e-05 + u_xlat0.x;
					    u_xlat16_9.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat9.xy = u_xlat16_9.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat3.xy = u_xlat9.xy / u_xlat2.xy;
					    u_xlat3.z = 1.0;
					    u_xlat9.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat1.w = fract(u_xlat28);
					    u_xlat1 = u_xlat1 * vec4(1.0, 1.0, -1.0, 52.9829178);
					    u_xlat28 = fract(u_xlat1.w);
					    u_xlat20.x = float(_SampleCount);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat29 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat22 = u_xlat4.y * 78.2330017;
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat6.z = u_xlat22 * 2.0 + -1.0;
					        u_xlat22 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = u_xlat22 * 6.28318548;
					        u_xlat7 = sin(u_xlat22);
					        u_xlat8.x = cos(u_xlat22);
					        u_xlat22 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat22 = sqrt(u_xlat22);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat22) * u_xlat8.xy;
					        u_xlat13.x = u_xlat4.y + 1.0;
					        u_xlat13.x = u_xlat13.x / u_xlat20.x;
					        u_xlat13.x = sqrt(u_xlat13.x);
					        u_xlat13.x = u_xlat13.x * _Radius;
					        u_xlat13.xyz = u_xlat13.xxx * u_xlat6.xyz;
					        u_xlat32 = dot((-u_xlat1.xyz), u_xlat13.xyz);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb32 = !!(u_xlat32>=0.0);
					#else
					        u_xlatb32 = u_xlat32>=0.0;
					#endif
					        u_xlat13.xyz = (bool(u_xlatb32)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat3.xyz * u_xlat0.xxx + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat16_6.xy = texture(_CameraDepthNormalsTexture, u_xlat6.xy).zw;
					        u_xlat31 = dot(u_xlat16_6.xy, vec2(1.0, 0.00392156886));
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb32 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati32 = u_xlatb32 ? 1 : int(0);
					        u_xlatb6.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlatb6.x = u_xlatb6.y || u_xlatb6.x;
					        u_xlati6 = u_xlatb6.x ? 1 : int(0);
					        u_xlati32 = u_xlati32 + u_xlati6;
					        u_xlat32 = float(u_xlati32);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb6.x = !!(u_xlat31>=0.999989986);
					#else
					        u_xlatb6.x = u_xlat31>=0.999989986;
					#endif
					        u_xlat6.x = u_xlatb6.x ? 1.0 : float(0.0);
					        u_xlat32 = u_xlat32 + u_xlat6.x;
					        u_xlat32 = u_xlat32 * 100000000.0;
					        u_xlat31 = u_xlat31 * _ProjectionParams.z + u_xlat32;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat31) + (-u_xlat9.xyz);
					        u_xlat5.x = dot(u_xlat13.xyz, u_xlat1.xyz);
					        u_xlat5.x = (-u_xlat0.x) * 0.00200000009 + u_xlat5.x;
					        u_xlat5.x = max(u_xlat5.x, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat13.x = u_xlat5.x / u_xlat13.x;
					        u_xlat29 = u_xlat29 + u_xlat13.x;
					    }
					    u_xlat0.x = u_xlat29 * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x / u_xlat20.x;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	int _SampleCount;
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraDepthNormalsTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					mediump vec2 u_xlat16_6;
					int u_xlati6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					vec3 u_xlat9;
					mediump vec2 u_xlat16_9;
					ivec2 u_xlati9;
					bvec2 u_xlatb9;
					vec3 u_xlat13;
					float u_xlat18;
					bvec2 u_xlatb18;
					vec2 u_xlat20;
					float u_xlat22;
					bool u_xlatb22;
					float u_xlat28;
					float u_xlat29;
					int u_xlati30;
					float u_xlat31;
					float u_xlat32;
					int u_xlati32;
					bool u_xlatb32;
					void main()
					{
					    u_xlat16_0 = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_0.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					    u_xlat16_0.x = 2.0 / u_xlat16_0.x;
					    u_xlat1.xy = u_xlat16_1.xy * u_xlat16_0.xx;
					    u_xlat1.z = u_xlat16_0.x + -1.0;
					    u_xlat0.x = dot(u_xlat16_0.zw, vec2(1.0, 0.00392156886));
					    u_xlatb9.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati9.x = int(uint((uint(u_xlatb9.y) * 0xffffffffu) | (uint(u_xlatb9.x) * 0xffffffffu)));
					    u_xlatb18.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati9.y = int(uint((uint(u_xlatb18.y) * 0xffffffffu) | (uint(u_xlatb18.x) * 0xffffffffu)));
					    u_xlati9.xy = ivec2(uvec2(uint(u_xlati9.x) & uint(1u), uint(u_xlati9.y) & uint(1u)));
					    u_xlati9.x = u_xlati9.y + u_xlati9.x;
					    u_xlat9.x = float(u_xlati9.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18.x = !!(u_xlat0.x>=0.999989986);
					#else
					    u_xlatb18.x = u_xlat0.x>=0.999989986;
					#endif
					    u_xlat18 = u_xlatb18.x ? 1.0 : float(0.0);
					    u_xlat9.x = u_xlat18 + u_xlat9.x;
					    u_xlat9.x = u_xlat9.x * 100000000.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z + u_xlat9.x;
					    u_xlat0.x = (-_ProjectionParams.z) * 1.52587891e-05 + u_xlat0.x;
					    u_xlat16_9.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat9.xy = u_xlat16_9.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat3.xy = u_xlat9.xy / u_xlat2.xy;
					    u_xlat3.z = 1.0;
					    u_xlat9.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat1.w = fract(u_xlat28);
					    u_xlat1 = u_xlat1 * vec4(1.0, 1.0, -1.0, 52.9829178);
					    u_xlat28 = fract(u_xlat1.w);
					    u_xlat20.x = float(_SampleCount);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat29 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat22 = u_xlat4.y * 78.2330017;
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat6.z = u_xlat22 * 2.0 + -1.0;
					        u_xlat22 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = u_xlat22 * 6.28318548;
					        u_xlat7 = sin(u_xlat22);
					        u_xlat8.x = cos(u_xlat22);
					        u_xlat22 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat22 = sqrt(u_xlat22);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat22) * u_xlat8.xy;
					        u_xlat13.x = u_xlat4.y + 1.0;
					        u_xlat13.x = u_xlat13.x / u_xlat20.x;
					        u_xlat13.x = sqrt(u_xlat13.x);
					        u_xlat13.x = u_xlat13.x * _Radius;
					        u_xlat13.xyz = u_xlat13.xxx * u_xlat6.xyz;
					        u_xlat32 = dot((-u_xlat1.xyz), u_xlat13.xyz);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb32 = !!(u_xlat32>=0.0);
					#else
					        u_xlatb32 = u_xlat32>=0.0;
					#endif
					        u_xlat13.xyz = (bool(u_xlatb32)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat3.xyz * u_xlat0.xxx + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat16_6.xy = texture(_CameraDepthNormalsTexture, u_xlat6.xy).zw;
					        u_xlat31 = dot(u_xlat16_6.xy, vec2(1.0, 0.00392156886));
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb32 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati32 = u_xlatb32 ? 1 : int(0);
					        u_xlatb6.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlatb6.x = u_xlatb6.y || u_xlatb6.x;
					        u_xlati6 = u_xlatb6.x ? 1 : int(0);
					        u_xlati32 = u_xlati32 + u_xlati6;
					        u_xlat32 = float(u_xlati32);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb6.x = !!(u_xlat31>=0.999989986);
					#else
					        u_xlatb6.x = u_xlat31>=0.999989986;
					#endif
					        u_xlat6.x = u_xlatb6.x ? 1.0 : float(0.0);
					        u_xlat32 = u_xlat32 + u_xlat6.x;
					        u_xlat32 = u_xlat32 * 100000000.0;
					        u_xlat31 = u_xlat31 * _ProjectionParams.z + u_xlat32;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat31) + (-u_xlat9.xyz);
					        u_xlat5.x = dot(u_xlat13.xyz, u_xlat1.xyz);
					        u_xlat5.x = (-u_xlat0.x) * 0.00200000009 + u_xlat5.x;
					        u_xlat5.x = max(u_xlat5.x, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat13.x = u_xlat5.x / u_xlat13.x;
					        u_xlat29 = u_xlat29 + u_xlat13.x;
					    }
					    u_xlat0.x = u_xlat29 * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x / u_xlat20.x;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 184628
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					uniform lowp sampler2D _CameraGBufferTexture2;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					int u_xlati6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					float u_xlat10;
					ivec2 u_xlati10;
					bvec2 u_xlatb10;
					vec3 u_xlat13;
					bvec2 u_xlatb19;
					vec2 u_xlat20;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					int u_xlati29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					int u_xlati32;
					bool u_xlatb32;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
					ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
					ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
					ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat27 = dot(u_xlat10_0.xyz, u_xlat10_0.xyz);
					    u_xlatb27 = u_xlat27!=0.0;
					    u_xlat27 = (u_xlatb27) ? -1.0 : -0.0;
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat27);
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat27 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat27 + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlatb10.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati10.x = op_or((int(u_xlatb10.y) * -1), (int(u_xlatb10.x) * -1));
					    u_xlatb19.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati10.y = op_or((int(u_xlatb19.y) * -1), (int(u_xlatb19.x) * -1));
					    u_xlati10.xy = op_and(u_xlati10.xy, ivec2(1, 1));
					    u_xlati10.x = u_xlati10.y + u_xlati10.x;
					    u_xlat10 = float(u_xlati10.x);
					    u_xlatb27 = u_xlat27>=0.999989986;
					    u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					    u_xlat27 = u_xlat27 + u_xlat10;
					    u_xlat27 = u_xlat27 * 100000000.0 + u_xlat1.x;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat16_1.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.z = 1.0;
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat28 = fract(u_xlat28);
					    u_xlat28 = u_xlat28 * 52.9829178;
					    u_xlat28 = fract(u_xlat28);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat20.x = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<5 ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat30 = u_xlat4.y * 78.2330017;
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat6.z = u_xlat30 * 2.0 + -1.0;
					        u_xlat30 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = u_xlat30 * 6.28318548;
					        u_xlat7 = sin(u_xlat30);
					        u_xlat8.x = cos(u_xlat30);
					        u_xlat30 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat30) * u_xlat8.xy;
					        u_xlat30 = u_xlat4.y + 1.0;
					        u_xlat30 = u_xlat30 * 0.200000003;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat30 = u_xlat30 * _Radius;
					        u_xlat13.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot((-u_xlat0.xyz), u_xlat13.xyz);
					        u_xlatb30 = u_xlat30>=0.0;
					        u_xlat13.xyz = (bool(u_xlatb30)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat1.xyz * vec3(u_xlat27) + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat30 = texture2D(_CameraDepthTexture, u_xlat6.xy).x;
					        u_xlat31 = _ZBufferParams.z * u_xlat30 + _ZBufferParams.w;
					        u_xlat31 = float(1.0) / u_xlat31;
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb32 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati32 = u_xlatb32 ? 1 : int(0);
					        u_xlatb6.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlatb6.x = u_xlatb6.y || u_xlatb6.x;
					        u_xlati6 = u_xlatb6.x ? 1 : int(0);
					        u_xlati32 = u_xlati32 + u_xlati6;
					        u_xlat32 = float(u_xlati32);
					        u_xlatb30 = u_xlat30>=0.999989986;
					        u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
					        u_xlat30 = u_xlat30 + u_xlat32;
					        u_xlat30 = u_xlat30 * 100000000.0 + u_xlat31;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat30) + (-u_xlat3.xyz);
					        u_xlat30 = dot(u_xlat13.xyz, u_xlat0.xyz);
					        u_xlat30 = (-u_xlat27) * 0.00200000009 + u_xlat30;
					        u_xlat30 = max(u_xlat30, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat30 = u_xlat30 / u_xlat13.x;
					        u_xlat20.x = u_xlat20.x + u_xlat30;
					    }
					    u_xlat0.x = u_xlat20.x * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x * 0.200000003;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					uniform lowp sampler2D _CameraGBufferTexture2;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					int u_xlati6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					float u_xlat10;
					ivec2 u_xlati10;
					bvec2 u_xlatb10;
					vec3 u_xlat13;
					bvec2 u_xlatb19;
					vec2 u_xlat20;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					int u_xlati29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					int u_xlati32;
					bool u_xlatb32;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
					ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
					ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
					ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat27 = dot(u_xlat10_0.xyz, u_xlat10_0.xyz);
					    u_xlatb27 = u_xlat27!=0.0;
					    u_xlat27 = (u_xlatb27) ? -1.0 : -0.0;
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat27);
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat27 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat27 + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlatb10.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati10.x = op_or((int(u_xlatb10.y) * -1), (int(u_xlatb10.x) * -1));
					    u_xlatb19.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati10.y = op_or((int(u_xlatb19.y) * -1), (int(u_xlatb19.x) * -1));
					    u_xlati10.xy = op_and(u_xlati10.xy, ivec2(1, 1));
					    u_xlati10.x = u_xlati10.y + u_xlati10.x;
					    u_xlat10 = float(u_xlati10.x);
					    u_xlatb27 = u_xlat27>=0.999989986;
					    u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					    u_xlat27 = u_xlat27 + u_xlat10;
					    u_xlat27 = u_xlat27 * 100000000.0 + u_xlat1.x;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat16_1.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.z = 1.0;
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat28 = fract(u_xlat28);
					    u_xlat28 = u_xlat28 * 52.9829178;
					    u_xlat28 = fract(u_xlat28);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat20.x = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<5 ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat30 = u_xlat4.y * 78.2330017;
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat6.z = u_xlat30 * 2.0 + -1.0;
					        u_xlat30 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = u_xlat30 * 6.28318548;
					        u_xlat7 = sin(u_xlat30);
					        u_xlat8.x = cos(u_xlat30);
					        u_xlat30 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat30) * u_xlat8.xy;
					        u_xlat30 = u_xlat4.y + 1.0;
					        u_xlat30 = u_xlat30 * 0.200000003;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat30 = u_xlat30 * _Radius;
					        u_xlat13.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot((-u_xlat0.xyz), u_xlat13.xyz);
					        u_xlatb30 = u_xlat30>=0.0;
					        u_xlat13.xyz = (bool(u_xlatb30)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat1.xyz * vec3(u_xlat27) + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat30 = texture2D(_CameraDepthTexture, u_xlat6.xy).x;
					        u_xlat31 = _ZBufferParams.z * u_xlat30 + _ZBufferParams.w;
					        u_xlat31 = float(1.0) / u_xlat31;
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb32 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati32 = u_xlatb32 ? 1 : int(0);
					        u_xlatb6.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlatb6.x = u_xlatb6.y || u_xlatb6.x;
					        u_xlati6 = u_xlatb6.x ? 1 : int(0);
					        u_xlati32 = u_xlati32 + u_xlati6;
					        u_xlat32 = float(u_xlati32);
					        u_xlatb30 = u_xlat30>=0.999989986;
					        u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
					        u_xlat30 = u_xlat30 + u_xlat32;
					        u_xlat30 = u_xlat30 * 100000000.0 + u_xlat31;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat30) + (-u_xlat3.xyz);
					        u_xlat30 = dot(u_xlat13.xyz, u_xlat0.xyz);
					        u_xlat30 = (-u_xlat27) * 0.00200000009 + u_xlat30;
					        u_xlat30 = max(u_xlat30, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat30 = u_xlat30 / u_xlat13.x;
					        u_xlat20.x = u_xlat20.x + u_xlat30;
					    }
					    u_xlat0.x = u_xlat20.x * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x * 0.200000003;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					uniform lowp sampler2D _CameraGBufferTexture2;
					uniform highp sampler2D _CameraDepthTexture;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					int u_xlati6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					float u_xlat10;
					ivec2 u_xlati10;
					bvec2 u_xlatb10;
					vec3 u_xlat13;
					bvec2 u_xlatb19;
					vec2 u_xlat20;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					int u_xlati29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					int u_xlati32;
					bool u_xlatb32;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
					ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
					ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
					ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat27 = dot(u_xlat10_0.xyz, u_xlat10_0.xyz);
					    u_xlatb27 = u_xlat27!=0.0;
					    u_xlat27 = (u_xlatb27) ? -1.0 : -0.0;
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat27);
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat27 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat27 + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlatb10.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati10.x = op_or((int(u_xlatb10.y) * -1), (int(u_xlatb10.x) * -1));
					    u_xlatb19.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati10.y = op_or((int(u_xlatb19.y) * -1), (int(u_xlatb19.x) * -1));
					    u_xlati10.xy = op_and(u_xlati10.xy, ivec2(1, 1));
					    u_xlati10.x = u_xlati10.y + u_xlati10.x;
					    u_xlat10 = float(u_xlati10.x);
					    u_xlatb27 = u_xlat27>=0.999989986;
					    u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					    u_xlat27 = u_xlat27 + u_xlat10;
					    u_xlat27 = u_xlat27 * 100000000.0 + u_xlat1.x;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat16_1.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.z = 1.0;
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat28 = fract(u_xlat28);
					    u_xlat28 = u_xlat28 * 52.9829178;
					    u_xlat28 = fract(u_xlat28);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat20.x = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<5 ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat30 = u_xlat4.y * 78.2330017;
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat6.z = u_xlat30 * 2.0 + -1.0;
					        u_xlat30 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat28 + u_xlat30;
					        u_xlat30 = u_xlat30 * 6.28318548;
					        u_xlat7 = sin(u_xlat30);
					        u_xlat8.x = cos(u_xlat30);
					        u_xlat30 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat30) * u_xlat8.xy;
					        u_xlat30 = u_xlat4.y + 1.0;
					        u_xlat30 = u_xlat30 * 0.200000003;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat30 = u_xlat30 * _Radius;
					        u_xlat13.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot((-u_xlat0.xyz), u_xlat13.xyz);
					        u_xlatb30 = u_xlat30>=0.0;
					        u_xlat13.xyz = (bool(u_xlatb30)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat1.xyz * vec3(u_xlat27) + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat30 = texture2D(_CameraDepthTexture, u_xlat6.xy).x;
					        u_xlat31 = _ZBufferParams.z * u_xlat30 + _ZBufferParams.w;
					        u_xlat31 = float(1.0) / u_xlat31;
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb32 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati32 = u_xlatb32 ? 1 : int(0);
					        u_xlatb6.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlatb6.x = u_xlatb6.y || u_xlatb6.x;
					        u_xlati6 = u_xlatb6.x ? 1 : int(0);
					        u_xlati32 = u_xlati32 + u_xlati6;
					        u_xlat32 = float(u_xlati32);
					        u_xlatb30 = u_xlat30>=0.999989986;
					        u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
					        u_xlat30 = u_xlat30 + u_xlat32;
					        u_xlat30 = u_xlat30 * 100000000.0 + u_xlat31;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat30) + (-u_xlat3.xyz);
					        u_xlat30 = dot(u_xlat13.xyz, u_xlat0.xyz);
					        u_xlat30 = (-u_xlat27) * 0.00200000009 + u_xlat30;
					        u_xlat30 = max(u_xlat30, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat30 = u_xlat30 / u_xlat13.x;
					        u_xlat20.x = u_xlat20.x + u_xlat30;
					    }
					    u_xlat0.x = u_xlat20.x * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x * 0.200000003;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	int _SampleCount;
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraGBufferTexture2;
					UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					ivec2 u_xlati6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					float u_xlat10;
					ivec2 u_xlati10;
					bvec2 u_xlatb10;
					vec3 u_xlat13;
					bvec2 u_xlatb15;
					bvec2 u_xlatb19;
					vec2 u_xlat20;
					float u_xlat22;
					bool u_xlatb22;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					float u_xlat29;
					int u_xlati30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					bool u_xlatb32;
					void main()
					{
					    u_xlat16_0.xyz = texture(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb27 = !!(u_xlat27!=0.0);
					#else
					    u_xlatb27 = u_xlat27!=0.0;
					#endif
					    u_xlat27 = (u_xlatb27) ? -1.0 : -0.0;
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat27);
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat27 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat27 + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlatb10.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati10.x = int(uint((uint(u_xlatb10.y) * 0xffffffffu) | (uint(u_xlatb10.x) * 0xffffffffu)));
					    u_xlatb19.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati10.y = int(uint((uint(u_xlatb19.y) * 0xffffffffu) | (uint(u_xlatb19.x) * 0xffffffffu)));
					    u_xlati10.xy = ivec2(uvec2(uint(u_xlati10.x) & uint(1u), uint(u_xlati10.y) & uint(1u)));
					    u_xlati10.x = u_xlati10.y + u_xlati10.x;
					    u_xlat10 = float(u_xlati10.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb27 = !!(u_xlat27>=0.999989986);
					#else
					    u_xlatb27 = u_xlat27>=0.999989986;
					#endif
					    u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					    u_xlat27 = u_xlat27 + u_xlat10;
					    u_xlat27 = u_xlat27 * 100000000.0 + u_xlat1.x;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat16_1.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.z = 1.0;
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat28 = fract(u_xlat28);
					    u_xlat28 = u_xlat28 * 52.9829178;
					    u_xlat28 = fract(u_xlat28);
					    u_xlat20.x = float(_SampleCount);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat29 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat22 = u_xlat4.y * 78.2330017;
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat6.z = u_xlat22 * 2.0 + -1.0;
					        u_xlat22 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = u_xlat22 * 6.28318548;
					        u_xlat7 = sin(u_xlat22);
					        u_xlat8.x = cos(u_xlat22);
					        u_xlat22 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat22 = sqrt(u_xlat22);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat22) * u_xlat8.xy;
					        u_xlat13.x = u_xlat4.y + 1.0;
					        u_xlat13.x = u_xlat13.x / u_xlat20.x;
					        u_xlat13.x = sqrt(u_xlat13.x);
					        u_xlat13.x = u_xlat13.x * _Radius;
					        u_xlat13.xyz = u_xlat13.xxx * u_xlat6.xyz;
					        u_xlat32 = dot((-u_xlat0.xyz), u_xlat13.xyz);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb32 = !!(u_xlat32>=0.0);
					#else
					        u_xlatb32 = u_xlat32>=0.0;
					#endif
					        u_xlat13.xyz = (bool(u_xlatb32)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat1.xyz * vec3(u_xlat27) + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat31 = texture(_CameraDepthTexture, u_xlat6.xy).x;
					        u_xlat32 = _ZBufferParams.z * u_xlat31 + _ZBufferParams.w;
					        u_xlat32 = float(1.0) / u_xlat32;
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlati6.x = int(uint((uint(u_xlatb6.y) * 0xffffffffu) | (uint(u_xlatb6.x) * 0xffffffffu)));
					        u_xlatb15.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlati6.y = int(uint((uint(u_xlatb15.y) * 0xffffffffu) | (uint(u_xlatb15.x) * 0xffffffffu)));
					        u_xlati6.xy = ivec2(uvec2(uint(u_xlati6.x) & uint(1u), uint(u_xlati6.y) & uint(1u)));
					        u_xlati6.x = u_xlati6.y + u_xlati6.x;
					        u_xlat6.x = float(u_xlati6.x);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb31 = !!(u_xlat31>=0.999989986);
					#else
					        u_xlatb31 = u_xlat31>=0.999989986;
					#endif
					        u_xlat31 = u_xlatb31 ? 1.0 : float(0.0);
					        u_xlat31 = u_xlat31 + u_xlat6.x;
					        u_xlat31 = u_xlat31 * 100000000.0 + u_xlat32;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat31) + (-u_xlat3.xyz);
					        u_xlat5.x = dot(u_xlat13.xyz, u_xlat0.xyz);
					        u_xlat5.x = (-u_xlat27) * 0.00200000009 + u_xlat5.x;
					        u_xlat5.x = max(u_xlat5.x, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat13.x = u_xlat5.x / u_xlat13.x;
					        u_xlat29 = u_xlat29 + u_xlat13.x;
					    }
					    u_xlat0.x = u_xlat29 * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x / u_xlat20.x;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	int _SampleCount;
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraGBufferTexture2;
					UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					ivec2 u_xlati6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					float u_xlat10;
					ivec2 u_xlati10;
					bvec2 u_xlatb10;
					vec3 u_xlat13;
					bvec2 u_xlatb15;
					bvec2 u_xlatb19;
					vec2 u_xlat20;
					float u_xlat22;
					bool u_xlatb22;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					float u_xlat29;
					int u_xlati30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					bool u_xlatb32;
					void main()
					{
					    u_xlat16_0.xyz = texture(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb27 = !!(u_xlat27!=0.0);
					#else
					    u_xlatb27 = u_xlat27!=0.0;
					#endif
					    u_xlat27 = (u_xlatb27) ? -1.0 : -0.0;
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat27);
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat27 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat27 + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlatb10.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati10.x = int(uint((uint(u_xlatb10.y) * 0xffffffffu) | (uint(u_xlatb10.x) * 0xffffffffu)));
					    u_xlatb19.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati10.y = int(uint((uint(u_xlatb19.y) * 0xffffffffu) | (uint(u_xlatb19.x) * 0xffffffffu)));
					    u_xlati10.xy = ivec2(uvec2(uint(u_xlati10.x) & uint(1u), uint(u_xlati10.y) & uint(1u)));
					    u_xlati10.x = u_xlati10.y + u_xlati10.x;
					    u_xlat10 = float(u_xlati10.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb27 = !!(u_xlat27>=0.999989986);
					#else
					    u_xlatb27 = u_xlat27>=0.999989986;
					#endif
					    u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					    u_xlat27 = u_xlat27 + u_xlat10;
					    u_xlat27 = u_xlat27 * 100000000.0 + u_xlat1.x;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat16_1.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.z = 1.0;
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat28 = fract(u_xlat28);
					    u_xlat28 = u_xlat28 * 52.9829178;
					    u_xlat28 = fract(u_xlat28);
					    u_xlat20.x = float(_SampleCount);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat29 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat22 = u_xlat4.y * 78.2330017;
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat6.z = u_xlat22 * 2.0 + -1.0;
					        u_xlat22 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = u_xlat22 * 6.28318548;
					        u_xlat7 = sin(u_xlat22);
					        u_xlat8.x = cos(u_xlat22);
					        u_xlat22 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat22 = sqrt(u_xlat22);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat22) * u_xlat8.xy;
					        u_xlat13.x = u_xlat4.y + 1.0;
					        u_xlat13.x = u_xlat13.x / u_xlat20.x;
					        u_xlat13.x = sqrt(u_xlat13.x);
					        u_xlat13.x = u_xlat13.x * _Radius;
					        u_xlat13.xyz = u_xlat13.xxx * u_xlat6.xyz;
					        u_xlat32 = dot((-u_xlat0.xyz), u_xlat13.xyz);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb32 = !!(u_xlat32>=0.0);
					#else
					        u_xlatb32 = u_xlat32>=0.0;
					#endif
					        u_xlat13.xyz = (bool(u_xlatb32)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat1.xyz * vec3(u_xlat27) + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat31 = texture(_CameraDepthTexture, u_xlat6.xy).x;
					        u_xlat32 = _ZBufferParams.z * u_xlat31 + _ZBufferParams.w;
					        u_xlat32 = float(1.0) / u_xlat32;
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlati6.x = int(uint((uint(u_xlatb6.y) * 0xffffffffu) | (uint(u_xlatb6.x) * 0xffffffffu)));
					        u_xlatb15.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlati6.y = int(uint((uint(u_xlatb15.y) * 0xffffffffu) | (uint(u_xlatb15.x) * 0xffffffffu)));
					        u_xlati6.xy = ivec2(uvec2(uint(u_xlati6.x) & uint(1u), uint(u_xlati6.y) & uint(1u)));
					        u_xlati6.x = u_xlati6.y + u_xlati6.x;
					        u_xlat6.x = float(u_xlati6.x);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb31 = !!(u_xlat31>=0.999989986);
					#else
					        u_xlatb31 = u_xlat31>=0.999989986;
					#endif
					        u_xlat31 = u_xlatb31 ? 1.0 : float(0.0);
					        u_xlat31 = u_xlat31 + u_xlat6.x;
					        u_xlat31 = u_xlat31 * 100000000.0 + u_xlat32;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat31) + (-u_xlat3.xyz);
					        u_xlat5.x = dot(u_xlat13.xyz, u_xlat0.xyz);
					        u_xlat5.x = (-u_xlat27) * 0.00200000009 + u_xlat5.x;
					        u_xlat5.x = max(u_xlat5.x, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat13.x = u_xlat5.x / u_xlat13.x;
					        u_xlat29 = u_xlat29 + u_xlat13.x;
					    }
					    u_xlat0.x = u_xlat29 * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x / u_xlat20.x;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	int _SampleCount;
					uniform 	mediump float _Intensity;
					uniform 	float _Radius;
					uniform 	float _TargetScale;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraGBufferTexture2;
					UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					ivec2 u_xlati6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					float u_xlat10;
					ivec2 u_xlati10;
					bvec2 u_xlatb10;
					vec3 u_xlat13;
					bvec2 u_xlatb15;
					bvec2 u_xlatb19;
					vec2 u_xlat20;
					float u_xlat22;
					bool u_xlatb22;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					float u_xlat29;
					int u_xlati30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					bool u_xlatb32;
					void main()
					{
					    u_xlat16_0.xyz = texture(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb27 = !!(u_xlat27!=0.0);
					#else
					    u_xlatb27 = u_xlat27!=0.0;
					#endif
					    u_xlat27 = (u_xlatb27) ? -1.0 : -0.0;
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat27);
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat27 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat1.x = _ZBufferParams.z * u_xlat27 + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlatb10.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati10.x = int(uint((uint(u_xlatb10.y) * 0xffffffffu) | (uint(u_xlatb10.x) * 0xffffffffu)));
					    u_xlatb19.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
					    u_xlati10.y = int(uint((uint(u_xlatb19.y) * 0xffffffffu) | (uint(u_xlatb19.x) * 0xffffffffu)));
					    u_xlati10.xy = ivec2(uvec2(uint(u_xlati10.x) & uint(1u), uint(u_xlati10.y) & uint(1u)));
					    u_xlati10.x = u_xlati10.y + u_xlati10.x;
					    u_xlat10 = float(u_xlati10.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb27 = !!(u_xlat27>=0.999989986);
					#else
					    u_xlatb27 = u_xlat27>=0.999989986;
					#endif
					    u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					    u_xlat27 = u_xlat27 + u_xlat10;
					    u_xlat27 = u_xlat27 * 100000000.0 + u_xlat1.x;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat16_1.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat2.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat2.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.z = 1.0;
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat20.xy = vs_TEXCOORD0.xy * vec2(vec2(_TargetScale, _TargetScale));
					    u_xlat20.xy = u_xlat20.xy * _ScreenParams.xy;
					    u_xlat20.xy = floor(u_xlat20.xy);
					    u_xlat28 = dot(vec2(0.0671105608, 0.00583714992), u_xlat20.xy);
					    u_xlat28 = fract(u_xlat28);
					    u_xlat28 = u_xlat28 * 52.9829178;
					    u_xlat28 = fract(u_xlat28);
					    u_xlat20.x = float(_SampleCount);
					    u_xlat4.x = 12.9898005;
					    u_xlat5.z = 1.0;
					    u_xlat29 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat4.y = float(u_xlati_loop_1);
					        u_xlat22 = u_xlat4.y * 78.2330017;
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat6.z = u_xlat22 * 2.0 + -1.0;
					        u_xlat22 = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat22 = sin(u_xlat22);
					        u_xlat22 = u_xlat22 * 43758.5469;
					        u_xlat22 = fract(u_xlat22);
					        u_xlat22 = u_xlat28 + u_xlat22;
					        u_xlat22 = u_xlat22 * 6.28318548;
					        u_xlat7 = sin(u_xlat22);
					        u_xlat8.x = cos(u_xlat22);
					        u_xlat22 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat22 = sqrt(u_xlat22);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat22) * u_xlat8.xy;
					        u_xlat13.x = u_xlat4.y + 1.0;
					        u_xlat13.x = u_xlat13.x / u_xlat20.x;
					        u_xlat13.x = sqrt(u_xlat13.x);
					        u_xlat13.x = u_xlat13.x * _Radius;
					        u_xlat13.xyz = u_xlat13.xxx * u_xlat6.xyz;
					        u_xlat32 = dot((-u_xlat0.xyz), u_xlat13.xyz);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb32 = !!(u_xlat32>=0.0);
					#else
					        u_xlatb32 = u_xlat32>=0.0;
					#endif
					        u_xlat13.xyz = (bool(u_xlatb32)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat1.xyz * vec3(u_xlat27) + u_xlat13.xyz;
					        u_xlat6.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat6.xy;
					        u_xlat13.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat13.xy;
					        u_xlat13.xy = u_xlat13.xy / u_xlat13.zz;
					        u_xlat13.xy = u_xlat13.xy + vec2(1.0, 1.0);
					        u_xlat6.xy = u_xlat13.xy * vec2(0.5, 0.5);
					        u_xlat31 = texture(_CameraDepthTexture, u_xlat6.xy).x;
					        u_xlat32 = _ZBufferParams.z * u_xlat31 + _ZBufferParams.w;
					        u_xlat32 = float(1.0) / u_xlat32;
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlati6.x = int(uint((uint(u_xlatb6.y) * 0xffffffffu) | (uint(u_xlatb6.x) * 0xffffffffu)));
					        u_xlatb15.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlati6.y = int(uint((uint(u_xlatb15.y) * 0xffffffffu) | (uint(u_xlatb15.x) * 0xffffffffu)));
					        u_xlati6.xy = ivec2(uvec2(uint(u_xlati6.x) & uint(1u), uint(u_xlati6.y) & uint(1u)));
					        u_xlati6.x = u_xlati6.y + u_xlati6.x;
					        u_xlat6.x = float(u_xlati6.x);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb31 = !!(u_xlat31>=0.999989986);
					#else
					        u_xlatb31 = u_xlat31>=0.999989986;
					#endif
					        u_xlat31 = u_xlatb31 ? 1.0 : float(0.0);
					        u_xlat31 = u_xlat31 + u_xlat6.x;
					        u_xlat31 = u_xlat31 * 100000000.0 + u_xlat32;
					        u_xlat13.xy = u_xlat13.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
					        u_xlat5.xy = u_xlat13.xy / u_xlat2.xy;
					        u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat31) + (-u_xlat3.xyz);
					        u_xlat5.x = dot(u_xlat13.xyz, u_xlat0.xyz);
					        u_xlat5.x = (-u_xlat27) * 0.00200000009 + u_xlat5.x;
					        u_xlat5.x = max(u_xlat5.x, 0.0);
					        u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat13.x = u_xlat13.x + 9.99999975e-05;
					        u_xlat13.x = u_xlat5.x / u_xlat13.x;
					        u_xlat29 = u_xlat29 + u_xlat13.x;
					    }
					    u_xlat0.x = u_xlat29 * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x / u_xlat20.x;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    u_xlat0 = exp2(u_xlat0.xxxx);
					    SV_Target0 = u_xlat0;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 253228
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					uniform lowp sampler2D _CameraDepthNormalsTexture;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					lowp float u_xlat10_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					mediump vec3 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					mediump float u_xlat16_4;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					mediump float u_xlat16_9;
					mediump float u_xlat16_10;
					mediump float u_xlat16_15;
					lowp float u_xlat10_15;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_10 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_10 = 2.0 / u_xlat16_10;
					    u_xlat1.xy = u_xlat16_0.xy * vec2(u_xlat16_10);
					    u_xlat1.z = u_xlat16_10 + -1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(_BlurVector.x, _BlurVector.y, _BlurVector.x, _BlurVector.y);
					    u_xlat2 = (-u_xlat1) * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1 * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat2.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					    u_xlat16_15 = 2.0 / u_xlat16_15;
					    u_xlat3.xy = u_xlat16_3.xy * vec2(u_xlat16_15);
					    u_xlat3.z = u_xlat16_15 + -1.0;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_4 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_4 = u_xlat16_4 + 1.0;
					    u_xlat16_4 = u_xlat16_4 * 0.5;
					    u_xlat16_15 = log2(u_xlat16_4);
					    u_xlat16_15 = u_xlat16_15 * 50.0;
					    u_xlat16_15 = exp2(u_xlat16_15);
					    u_xlat16_4 = u_xlat16_15 * 0.31621623;
					    u_xlat10_15 = texture2D(_MainTex, u_xlat2.xy).x;
					    u_xlat16_15 = u_xlat16_4 * u_xlat10_15;
					    u_xlat10_2.x = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_15 = u_xlat10_2.x * 0.227027029 + u_xlat16_15;
					    u_xlat10_3.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat1.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_2.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					    u_xlat16_2.x = 2.0 / u_xlat16_2.x;
					    u_xlat3.xy = u_xlat16_3.xy * u_xlat16_2.xx;
					    u_xlat3.z = u_xlat16_2.x + -1.0;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_2.x = log2(u_xlat16_9);
					    u_xlat16_2.x = u_xlat16_2.x * 50.0;
					    u_xlat16_2.x = exp2(u_xlat16_2.x);
					    u_xlat16_9 = u_xlat16_2.x * 0.31621623;
					    u_xlat16_4 = u_xlat16_2.x * 0.31621623 + u_xlat16_4;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy).x;
					    u_xlat16_15 = u_xlat10_1 * u_xlat16_9 + u_xlat16_15;
					    u_xlat10_3.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat2.zw).xyz;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat2.zw).x;
					    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_6.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_6.x = 2.0 / u_xlat16_6.x;
					    u_xlat2.xy = u_xlat16_2.xy * u_xlat16_6.xx;
					    u_xlat2.z = u_xlat16_6.x + -1.0;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_6.x = log2(u_xlat16_9);
					    u_xlat16_6.x = u_xlat16_6.x * 50.0;
					    u_xlat16_6.x = exp2(u_xlat16_6.x);
					    u_xlat16_9 = u_xlat16_6.x * 0.0702702701;
					    u_xlat16_4 = u_xlat16_6.x * 0.0702702701 + u_xlat16_4;
					    u_xlat16_15 = u_xlat10_1 * u_xlat16_9 + u_xlat16_15;
					    u_xlat10_2.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat1.zw).xyz;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat1.zw).x;
					    u_xlat16_6.xyz = u_xlat10_2.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_16 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
					    u_xlat16_16 = 2.0 / u_xlat16_16;
					    u_xlat2.xy = u_xlat16_6.xy * vec2(u_xlat16_16);
					    u_xlat2.z = u_xlat16_16 + -1.0;
					    u_xlat6.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat6.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_0.x = log2(u_xlat16_9);
					    u_xlat16_0.x = u_xlat16_0.x * 50.0;
					    u_xlat16_0.x = exp2(u_xlat16_0.x);
					    u_xlat16_9 = u_xlat16_0.x * 0.0702702701;
					    u_xlat16_4 = u_xlat16_0.x * 0.0702702701 + u_xlat16_4;
					    u_xlat16_4 = u_xlat16_4 + 0.227027029;
					    u_xlat16_0.x = u_xlat10_1 * u_xlat16_9 + u_xlat16_15;
					    SV_Target0 = u_xlat16_0.xxxx / vec4(u_xlat16_4);
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					uniform lowp sampler2D _CameraDepthNormalsTexture;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					lowp float u_xlat10_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					mediump vec3 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					mediump float u_xlat16_4;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					mediump float u_xlat16_9;
					mediump float u_xlat16_10;
					mediump float u_xlat16_15;
					lowp float u_xlat10_15;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_10 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_10 = 2.0 / u_xlat16_10;
					    u_xlat1.xy = u_xlat16_0.xy * vec2(u_xlat16_10);
					    u_xlat1.z = u_xlat16_10 + -1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(_BlurVector.x, _BlurVector.y, _BlurVector.x, _BlurVector.y);
					    u_xlat2 = (-u_xlat1) * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1 * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat2.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					    u_xlat16_15 = 2.0 / u_xlat16_15;
					    u_xlat3.xy = u_xlat16_3.xy * vec2(u_xlat16_15);
					    u_xlat3.z = u_xlat16_15 + -1.0;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_4 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_4 = u_xlat16_4 + 1.0;
					    u_xlat16_4 = u_xlat16_4 * 0.5;
					    u_xlat16_15 = log2(u_xlat16_4);
					    u_xlat16_15 = u_xlat16_15 * 50.0;
					    u_xlat16_15 = exp2(u_xlat16_15);
					    u_xlat16_4 = u_xlat16_15 * 0.31621623;
					    u_xlat10_15 = texture2D(_MainTex, u_xlat2.xy).x;
					    u_xlat16_15 = u_xlat16_4 * u_xlat10_15;
					    u_xlat10_2.x = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_15 = u_xlat10_2.x * 0.227027029 + u_xlat16_15;
					    u_xlat10_3.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat1.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_2.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					    u_xlat16_2.x = 2.0 / u_xlat16_2.x;
					    u_xlat3.xy = u_xlat16_3.xy * u_xlat16_2.xx;
					    u_xlat3.z = u_xlat16_2.x + -1.0;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_2.x = log2(u_xlat16_9);
					    u_xlat16_2.x = u_xlat16_2.x * 50.0;
					    u_xlat16_2.x = exp2(u_xlat16_2.x);
					    u_xlat16_9 = u_xlat16_2.x * 0.31621623;
					    u_xlat16_4 = u_xlat16_2.x * 0.31621623 + u_xlat16_4;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy).x;
					    u_xlat16_15 = u_xlat10_1 * u_xlat16_9 + u_xlat16_15;
					    u_xlat10_3.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat2.zw).xyz;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat2.zw).x;
					    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_6.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_6.x = 2.0 / u_xlat16_6.x;
					    u_xlat2.xy = u_xlat16_2.xy * u_xlat16_6.xx;
					    u_xlat2.z = u_xlat16_6.x + -1.0;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_6.x = log2(u_xlat16_9);
					    u_xlat16_6.x = u_xlat16_6.x * 50.0;
					    u_xlat16_6.x = exp2(u_xlat16_6.x);
					    u_xlat16_9 = u_xlat16_6.x * 0.0702702701;
					    u_xlat16_4 = u_xlat16_6.x * 0.0702702701 + u_xlat16_4;
					    u_xlat16_15 = u_xlat10_1 * u_xlat16_9 + u_xlat16_15;
					    u_xlat10_2.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat1.zw).xyz;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat1.zw).x;
					    u_xlat16_6.xyz = u_xlat10_2.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_16 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
					    u_xlat16_16 = 2.0 / u_xlat16_16;
					    u_xlat2.xy = u_xlat16_6.xy * vec2(u_xlat16_16);
					    u_xlat2.z = u_xlat16_16 + -1.0;
					    u_xlat6.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat6.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_0.x = log2(u_xlat16_9);
					    u_xlat16_0.x = u_xlat16_0.x * 50.0;
					    u_xlat16_0.x = exp2(u_xlat16_0.x);
					    u_xlat16_9 = u_xlat16_0.x * 0.0702702701;
					    u_xlat16_4 = u_xlat16_0.x * 0.0702702701 + u_xlat16_4;
					    u_xlat16_4 = u_xlat16_4 + 0.227027029;
					    u_xlat16_0.x = u_xlat10_1 * u_xlat16_9 + u_xlat16_15;
					    SV_Target0 = u_xlat16_0.xxxx / vec4(u_xlat16_4);
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					uniform lowp sampler2D _CameraDepthNormalsTexture;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					lowp float u_xlat10_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					mediump vec3 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					mediump float u_xlat16_4;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					mediump float u_xlat16_9;
					mediump float u_xlat16_10;
					mediump float u_xlat16_15;
					lowp float u_xlat10_15;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_10 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_10 = 2.0 / u_xlat16_10;
					    u_xlat1.xy = u_xlat16_0.xy * vec2(u_xlat16_10);
					    u_xlat1.z = u_xlat16_10 + -1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(_BlurVector.x, _BlurVector.y, _BlurVector.x, _BlurVector.y);
					    u_xlat2 = (-u_xlat1) * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1 * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat2.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					    u_xlat16_15 = 2.0 / u_xlat16_15;
					    u_xlat3.xy = u_xlat16_3.xy * vec2(u_xlat16_15);
					    u_xlat3.z = u_xlat16_15 + -1.0;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_4 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_4 = u_xlat16_4 + 1.0;
					    u_xlat16_4 = u_xlat16_4 * 0.5;
					    u_xlat16_15 = log2(u_xlat16_4);
					    u_xlat16_15 = u_xlat16_15 * 50.0;
					    u_xlat16_15 = exp2(u_xlat16_15);
					    u_xlat16_4 = u_xlat16_15 * 0.31621623;
					    u_xlat10_15 = texture2D(_MainTex, u_xlat2.xy).x;
					    u_xlat16_15 = u_xlat16_4 * u_xlat10_15;
					    u_xlat10_2.x = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_15 = u_xlat10_2.x * 0.227027029 + u_xlat16_15;
					    u_xlat10_3.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat1.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_2.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					    u_xlat16_2.x = 2.0 / u_xlat16_2.x;
					    u_xlat3.xy = u_xlat16_3.xy * u_xlat16_2.xx;
					    u_xlat3.z = u_xlat16_2.x + -1.0;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_2.x = log2(u_xlat16_9);
					    u_xlat16_2.x = u_xlat16_2.x * 50.0;
					    u_xlat16_2.x = exp2(u_xlat16_2.x);
					    u_xlat16_9 = u_xlat16_2.x * 0.31621623;
					    u_xlat16_4 = u_xlat16_2.x * 0.31621623 + u_xlat16_4;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy).x;
					    u_xlat16_15 = u_xlat10_1 * u_xlat16_9 + u_xlat16_15;
					    u_xlat10_3.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat2.zw).xyz;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat2.zw).x;
					    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_6.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_6.x = 2.0 / u_xlat16_6.x;
					    u_xlat2.xy = u_xlat16_2.xy * u_xlat16_6.xx;
					    u_xlat2.z = u_xlat16_6.x + -1.0;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_6.x = log2(u_xlat16_9);
					    u_xlat16_6.x = u_xlat16_6.x * 50.0;
					    u_xlat16_6.x = exp2(u_xlat16_6.x);
					    u_xlat16_9 = u_xlat16_6.x * 0.0702702701;
					    u_xlat16_4 = u_xlat16_6.x * 0.0702702701 + u_xlat16_4;
					    u_xlat16_15 = u_xlat10_1 * u_xlat16_9 + u_xlat16_15;
					    u_xlat10_2.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat1.zw).xyz;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat1.zw).x;
					    u_xlat16_6.xyz = u_xlat10_2.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_16 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
					    u_xlat16_16 = 2.0 / u_xlat16_16;
					    u_xlat2.xy = u_xlat16_6.xy * vec2(u_xlat16_16);
					    u_xlat2.z = u_xlat16_16 + -1.0;
					    u_xlat6.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat6.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_0.x = log2(u_xlat16_9);
					    u_xlat16_0.x = u_xlat16_0.x * 50.0;
					    u_xlat16_0.x = exp2(u_xlat16_0.x);
					    u_xlat16_9 = u_xlat16_0.x * 0.0702702701;
					    u_xlat16_4 = u_xlat16_0.x * 0.0702702701 + u_xlat16_4;
					    u_xlat16_4 = u_xlat16_4 + 0.227027029;
					    u_xlat16_0.x = u_xlat10_1 * u_xlat16_9 + u_xlat16_15;
					    SV_Target0 = u_xlat16_0.xxxx / vec4(u_xlat16_4);
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraDepthNormalsTexture;
					UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump float u_xlat16_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump vec3 u_xlat16_3;
					mediump float u_xlat16_4;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					mediump float u_xlat16_9;
					mediump float u_xlat16_10;
					mediump float u_xlat16_15;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat16_0.xyz = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_10 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_10 = 2.0 / u_xlat16_10;
					    u_xlat1.xy = u_xlat16_0.xy * vec2(u_xlat16_10);
					    u_xlat1.z = u_xlat16_10 + -1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(_BlurVector.x, _BlurVector.y, _BlurVector.x, _BlurVector.y);
					    u_xlat2 = (-u_xlat1) * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1 * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat16_3.xyz = texture(_CameraDepthNormalsTexture, u_xlat2.xy).xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					    u_xlat16_15 = 2.0 / u_xlat16_15;
					    u_xlat3.xy = u_xlat16_3.xy * vec2(u_xlat16_15);
					    u_xlat3.z = u_xlat16_15 + -1.0;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_4 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_4 = u_xlat16_4 + 1.0;
					    u_xlat16_4 = u_xlat16_4 * 0.5;
					    u_xlat16_15 = log2(u_xlat16_4);
					    u_xlat16_15 = u_xlat16_15 * 50.0;
					    u_xlat16_15 = exp2(u_xlat16_15);
					    u_xlat16_4 = u_xlat16_15 * 0.31621623;
					    u_xlat16_15 = texture(_MainTex, u_xlat2.xy).x;
					    u_xlat16_15 = u_xlat16_4 * u_xlat16_15;
					    u_xlat16_2.x = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_15 = u_xlat16_2.x * 0.227027029 + u_xlat16_15;
					    u_xlat16_3.xyz = texture(_CameraDepthNormalsTexture, u_xlat1.xy).xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_2.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					    u_xlat16_2.x = 2.0 / u_xlat16_2.x;
					    u_xlat3.xy = u_xlat16_3.xy * u_xlat16_2.xx;
					    u_xlat3.z = u_xlat16_2.x + -1.0;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_2.x = log2(u_xlat16_9);
					    u_xlat16_2.x = u_xlat16_2.x * 50.0;
					    u_xlat16_2.x = exp2(u_xlat16_2.x);
					    u_xlat16_9 = u_xlat16_2.x * 0.31621623;
					    u_xlat16_4 = u_xlat16_2.x * 0.31621623 + u_xlat16_4;
					    u_xlat16_1 = texture(_MainTex, u_xlat1.xy).x;
					    u_xlat16_15 = u_xlat16_1 * u_xlat16_9 + u_xlat16_15;
					    u_xlat16_3.xyz = texture(_CameraDepthNormalsTexture, u_xlat2.zw).xyz;
					    u_xlat16_1 = texture(_MainTex, u_xlat2.zw).x;
					    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_6.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_6.x = 2.0 / u_xlat16_6.x;
					    u_xlat2.xy = u_xlat16_2.xy * u_xlat16_6.xx;
					    u_xlat2.z = u_xlat16_6.x + -1.0;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_6.x = log2(u_xlat16_9);
					    u_xlat16_6.x = u_xlat16_6.x * 50.0;
					    u_xlat16_6.x = exp2(u_xlat16_6.x);
					    u_xlat16_9 = u_xlat16_6.x * 0.0702702701;
					    u_xlat16_4 = u_xlat16_6.x * 0.0702702701 + u_xlat16_4;
					    u_xlat16_15 = u_xlat16_1 * u_xlat16_9 + u_xlat16_15;
					    u_xlat16_2.xyz = texture(_CameraDepthNormalsTexture, u_xlat1.zw).xyz;
					    u_xlat16_1 = texture(_MainTex, u_xlat1.zw).x;
					    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_16 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
					    u_xlat16_16 = 2.0 / u_xlat16_16;
					    u_xlat2.xy = u_xlat16_6.xy * vec2(u_xlat16_16);
					    u_xlat2.z = u_xlat16_16 + -1.0;
					    u_xlat6.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat6.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_0.x = log2(u_xlat16_9);
					    u_xlat16_0.x = u_xlat16_0.x * 50.0;
					    u_xlat16_0.x = exp2(u_xlat16_0.x);
					    u_xlat16_9 = u_xlat16_0.x * 0.0702702701;
					    u_xlat16_4 = u_xlat16_0.x * 0.0702702701 + u_xlat16_4;
					    u_xlat16_4 = u_xlat16_4 + 0.227027029;
					    u_xlat16_0.x = u_xlat16_1 * u_xlat16_9 + u_xlat16_15;
					    SV_Target0 = u_xlat16_0.xxxx / vec4(u_xlat16_4);
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraDepthNormalsTexture;
					UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump float u_xlat16_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump vec3 u_xlat16_3;
					mediump float u_xlat16_4;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					mediump float u_xlat16_9;
					mediump float u_xlat16_10;
					mediump float u_xlat16_15;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat16_0.xyz = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_10 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_10 = 2.0 / u_xlat16_10;
					    u_xlat1.xy = u_xlat16_0.xy * vec2(u_xlat16_10);
					    u_xlat1.z = u_xlat16_10 + -1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(_BlurVector.x, _BlurVector.y, _BlurVector.x, _BlurVector.y);
					    u_xlat2 = (-u_xlat1) * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1 * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat16_3.xyz = texture(_CameraDepthNormalsTexture, u_xlat2.xy).xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					    u_xlat16_15 = 2.0 / u_xlat16_15;
					    u_xlat3.xy = u_xlat16_3.xy * vec2(u_xlat16_15);
					    u_xlat3.z = u_xlat16_15 + -1.0;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_4 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_4 = u_xlat16_4 + 1.0;
					    u_xlat16_4 = u_xlat16_4 * 0.5;
					    u_xlat16_15 = log2(u_xlat16_4);
					    u_xlat16_15 = u_xlat16_15 * 50.0;
					    u_xlat16_15 = exp2(u_xlat16_15);
					    u_xlat16_4 = u_xlat16_15 * 0.31621623;
					    u_xlat16_15 = texture(_MainTex, u_xlat2.xy).x;
					    u_xlat16_15 = u_xlat16_4 * u_xlat16_15;
					    u_xlat16_2.x = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_15 = u_xlat16_2.x * 0.227027029 + u_xlat16_15;
					    u_xlat16_3.xyz = texture(_CameraDepthNormalsTexture, u_xlat1.xy).xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_2.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					    u_xlat16_2.x = 2.0 / u_xlat16_2.x;
					    u_xlat3.xy = u_xlat16_3.xy * u_xlat16_2.xx;
					    u_xlat3.z = u_xlat16_2.x + -1.0;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_2.x = log2(u_xlat16_9);
					    u_xlat16_2.x = u_xlat16_2.x * 50.0;
					    u_xlat16_2.x = exp2(u_xlat16_2.x);
					    u_xlat16_9 = u_xlat16_2.x * 0.31621623;
					    u_xlat16_4 = u_xlat16_2.x * 0.31621623 + u_xlat16_4;
					    u_xlat16_1 = texture(_MainTex, u_xlat1.xy).x;
					    u_xlat16_15 = u_xlat16_1 * u_xlat16_9 + u_xlat16_15;
					    u_xlat16_3.xyz = texture(_CameraDepthNormalsTexture, u_xlat2.zw).xyz;
					    u_xlat16_1 = texture(_MainTex, u_xlat2.zw).x;
					    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_6.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_6.x = 2.0 / u_xlat16_6.x;
					    u_xlat2.xy = u_xlat16_2.xy * u_xlat16_6.xx;
					    u_xlat2.z = u_xlat16_6.x + -1.0;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_6.x = log2(u_xlat16_9);
					    u_xlat16_6.x = u_xlat16_6.x * 50.0;
					    u_xlat16_6.x = exp2(u_xlat16_6.x);
					    u_xlat16_9 = u_xlat16_6.x * 0.0702702701;
					    u_xlat16_4 = u_xlat16_6.x * 0.0702702701 + u_xlat16_4;
					    u_xlat16_15 = u_xlat16_1 * u_xlat16_9 + u_xlat16_15;
					    u_xlat16_2.xyz = texture(_CameraDepthNormalsTexture, u_xlat1.zw).xyz;
					    u_xlat16_1 = texture(_MainTex, u_xlat1.zw).x;
					    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_16 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
					    u_xlat16_16 = 2.0 / u_xlat16_16;
					    u_xlat2.xy = u_xlat16_6.xy * vec2(u_xlat16_16);
					    u_xlat2.z = u_xlat16_16 + -1.0;
					    u_xlat6.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat6.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_0.x = log2(u_xlat16_9);
					    u_xlat16_0.x = u_xlat16_0.x * 50.0;
					    u_xlat16_0.x = exp2(u_xlat16_0.x);
					    u_xlat16_9 = u_xlat16_0.x * 0.0702702701;
					    u_xlat16_4 = u_xlat16_0.x * 0.0702702701 + u_xlat16_4;
					    u_xlat16_4 = u_xlat16_4 + 0.227027029;
					    u_xlat16_0.x = u_xlat16_1 * u_xlat16_9 + u_xlat16_15;
					    SV_Target0 = u_xlat16_0.xxxx / vec4(u_xlat16_4);
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraDepthNormalsTexture;
					UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump float u_xlat16_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump vec3 u_xlat16_3;
					mediump float u_xlat16_4;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					mediump float u_xlat16_9;
					mediump float u_xlat16_10;
					mediump float u_xlat16_15;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat16_0.xyz = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_10 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_10 = 2.0 / u_xlat16_10;
					    u_xlat1.xy = u_xlat16_0.xy * vec2(u_xlat16_10);
					    u_xlat1.z = u_xlat16_10 + -1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(_BlurVector.x, _BlurVector.y, _BlurVector.x, _BlurVector.y);
					    u_xlat2 = (-u_xlat1) * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1 * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat16_3.xyz = texture(_CameraDepthNormalsTexture, u_xlat2.xy).xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					    u_xlat16_15 = 2.0 / u_xlat16_15;
					    u_xlat3.xy = u_xlat16_3.xy * vec2(u_xlat16_15);
					    u_xlat3.z = u_xlat16_15 + -1.0;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_4 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_4 = u_xlat16_4 + 1.0;
					    u_xlat16_4 = u_xlat16_4 * 0.5;
					    u_xlat16_15 = log2(u_xlat16_4);
					    u_xlat16_15 = u_xlat16_15 * 50.0;
					    u_xlat16_15 = exp2(u_xlat16_15);
					    u_xlat16_4 = u_xlat16_15 * 0.31621623;
					    u_xlat16_15 = texture(_MainTex, u_xlat2.xy).x;
					    u_xlat16_15 = u_xlat16_4 * u_xlat16_15;
					    u_xlat16_2.x = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_15 = u_xlat16_2.x * 0.227027029 + u_xlat16_15;
					    u_xlat16_3.xyz = texture(_CameraDepthNormalsTexture, u_xlat1.xy).xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_2.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					    u_xlat16_2.x = 2.0 / u_xlat16_2.x;
					    u_xlat3.xy = u_xlat16_3.xy * u_xlat16_2.xx;
					    u_xlat3.z = u_xlat16_2.x + -1.0;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_2.x = log2(u_xlat16_9);
					    u_xlat16_2.x = u_xlat16_2.x * 50.0;
					    u_xlat16_2.x = exp2(u_xlat16_2.x);
					    u_xlat16_9 = u_xlat16_2.x * 0.31621623;
					    u_xlat16_4 = u_xlat16_2.x * 0.31621623 + u_xlat16_4;
					    u_xlat16_1 = texture(_MainTex, u_xlat1.xy).x;
					    u_xlat16_15 = u_xlat16_1 * u_xlat16_9 + u_xlat16_15;
					    u_xlat16_3.xyz = texture(_CameraDepthNormalsTexture, u_xlat2.zw).xyz;
					    u_xlat16_1 = texture(_MainTex, u_xlat2.zw).x;
					    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_6.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_6.x = 2.0 / u_xlat16_6.x;
					    u_xlat2.xy = u_xlat16_2.xy * u_xlat16_6.xx;
					    u_xlat2.z = u_xlat16_6.x + -1.0;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_6.x = log2(u_xlat16_9);
					    u_xlat16_6.x = u_xlat16_6.x * 50.0;
					    u_xlat16_6.x = exp2(u_xlat16_6.x);
					    u_xlat16_9 = u_xlat16_6.x * 0.0702702701;
					    u_xlat16_4 = u_xlat16_6.x * 0.0702702701 + u_xlat16_4;
					    u_xlat16_15 = u_xlat16_1 * u_xlat16_9 + u_xlat16_15;
					    u_xlat16_2.xyz = texture(_CameraDepthNormalsTexture, u_xlat1.zw).xyz;
					    u_xlat16_1 = texture(_MainTex, u_xlat1.zw).x;
					    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_16 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
					    u_xlat16_16 = 2.0 / u_xlat16_16;
					    u_xlat2.xy = u_xlat16_6.xy * vec2(u_xlat16_16);
					    u_xlat2.z = u_xlat16_16 + -1.0;
					    u_xlat6.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_9 = dot(u_xlat0.xyz, u_xlat6.xyz);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = u_xlat16_9 * 0.5;
					    u_xlat16_0.x = log2(u_xlat16_9);
					    u_xlat16_0.x = u_xlat16_0.x * 50.0;
					    u_xlat16_0.x = exp2(u_xlat16_0.x);
					    u_xlat16_9 = u_xlat16_0.x * 0.0702702701;
					    u_xlat16_4 = u_xlat16_0.x * 0.0702702701 + u_xlat16_4;
					    u_xlat16_4 = u_xlat16_4 + 0.227027029;
					    u_xlat16_0.x = u_xlat16_1 * u_xlat16_9 + u_xlat16_15;
					    SV_Target0 = u_xlat16_0.xxxx / vec4(u_xlat16_4);
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 300499
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					uniform lowp sampler2D _CameraGBufferTexture2;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					lowp float u_xlat10_1;
					vec4 u_xlat2;
					mediump float u_xlat16_2;
					lowp vec3 u_xlat10_2;
					bool u_xlatb2;
					vec4 u_xlat3;
					lowp vec3 u_xlat10_3;
					vec3 u_xlat4;
					mediump float u_xlat16_5;
					vec3 u_xlat7;
					mediump float u_xlat16_7;
					bool u_xlatb7;
					mediump float u_xlat16_11;
					float u_xlat18;
					mediump float u_xlat16_18;
					lowp float u_xlat10_18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat18 = dot(u_xlat10_0.xyz, u_xlat10_0.xyz);
					    u_xlatb18 = u_xlat18!=0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : -0.0;
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(_BlurVector.x, _BlurVector.y, _BlurVector.x, _BlurVector.y);
					    u_xlat2 = (-u_xlat1) * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1 * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture2D(_CameraGBufferTexture2, u_xlat2.xy).xyz;
					    u_xlat18 = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
					    u_xlatb18 = u_xlat18!=0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : -0.0;
					    u_xlat3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat18);
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat16_5 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_5 = u_xlat16_5 + 1.0;
					    u_xlat16_5 = u_xlat16_5 * 0.5;
					    u_xlat16_18 = log2(u_xlat16_5);
					    u_xlat16_18 = u_xlat16_18 * 50.0;
					    u_xlat16_18 = exp2(u_xlat16_18);
					    u_xlat16_5 = u_xlat16_18 * 0.31621623;
					    u_xlat10_18 = texture2D(_MainTex, u_xlat2.xy).x;
					    u_xlat16_18 = u_xlat16_5 * u_xlat10_18;
					    u_xlat10_2.x = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_18 = u_xlat10_2.x * 0.227027029 + u_xlat16_18;
					    u_xlat10_3.xyz = texture2D(_CameraGBufferTexture2, u_xlat1.xy).xyz;
					    u_xlat2.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
					    u_xlatb2 = u_xlat2.x!=0.0;
					    u_xlat2.x = (u_xlatb2) ? -1.0 : -0.0;
					    u_xlat3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat2.xxx;
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_2 = log2(u_xlat16_11);
					    u_xlat16_2 = u_xlat16_2 * 50.0;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat16_11 = u_xlat16_2 * 0.31621623;
					    u_xlat16_5 = u_xlat16_2 * 0.31621623 + u_xlat16_5;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy).x;
					    u_xlat16_18 = u_xlat10_1 * u_xlat16_11 + u_xlat16_18;
					    u_xlat10_3.xyz = texture2D(_CameraGBufferTexture2, u_xlat2.zw).xyz;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat2.zw).x;
					    u_xlat7.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
					    u_xlatb7 = u_xlat7.x!=0.0;
					    u_xlat7.x = (u_xlatb7) ? -1.0 : -0.0;
					    u_xlat2.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat7.xxx;
					    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_7 = log2(u_xlat16_11);
					    u_xlat16_7 = u_xlat16_7 * 50.0;
					    u_xlat16_7 = exp2(u_xlat16_7);
					    u_xlat16_11 = u_xlat16_7 * 0.0702702701;
					    u_xlat16_5 = u_xlat16_7 * 0.0702702701 + u_xlat16_5;
					    u_xlat16_18 = u_xlat10_1 * u_xlat16_11 + u_xlat16_18;
					    u_xlat10_2.xyz = texture2D(_CameraGBufferTexture2, u_xlat1.zw).xyz;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat1.zw).x;
					    u_xlat7.x = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlatb7 = u_xlat7.x!=0.0;
					    u_xlat7.x = (u_xlatb7) ? -1.0 : -0.0;
					    u_xlat7.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat7.xxx;
					    u_xlat2.xyz = u_xlat7.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat7.xxx + u_xlat2.xyz;
					    u_xlat7.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat7.zzz + u_xlat2.xyz;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat7.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_0 = log2(u_xlat16_11);
					    u_xlat16_0 = u_xlat16_0 * 50.0;
					    u_xlat16_0 = exp2(u_xlat16_0);
					    u_xlat16_11 = u_xlat16_0 * 0.0702702701;
					    u_xlat16_5 = u_xlat16_0 * 0.0702702701 + u_xlat16_5;
					    u_xlat16_5 = u_xlat16_5 + 0.227027029;
					    u_xlat16_0 = u_xlat10_1 * u_xlat16_11 + u_xlat16_18;
					    SV_Target0 = vec4(u_xlat16_0) / vec4(u_xlat16_5);
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					uniform lowp sampler2D _CameraGBufferTexture2;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					lowp float u_xlat10_1;
					vec4 u_xlat2;
					mediump float u_xlat16_2;
					lowp vec3 u_xlat10_2;
					bool u_xlatb2;
					vec4 u_xlat3;
					lowp vec3 u_xlat10_3;
					vec3 u_xlat4;
					mediump float u_xlat16_5;
					vec3 u_xlat7;
					mediump float u_xlat16_7;
					bool u_xlatb7;
					mediump float u_xlat16_11;
					float u_xlat18;
					mediump float u_xlat16_18;
					lowp float u_xlat10_18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat18 = dot(u_xlat10_0.xyz, u_xlat10_0.xyz);
					    u_xlatb18 = u_xlat18!=0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : -0.0;
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(_BlurVector.x, _BlurVector.y, _BlurVector.x, _BlurVector.y);
					    u_xlat2 = (-u_xlat1) * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1 * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture2D(_CameraGBufferTexture2, u_xlat2.xy).xyz;
					    u_xlat18 = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
					    u_xlatb18 = u_xlat18!=0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : -0.0;
					    u_xlat3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat18);
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat16_5 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_5 = u_xlat16_5 + 1.0;
					    u_xlat16_5 = u_xlat16_5 * 0.5;
					    u_xlat16_18 = log2(u_xlat16_5);
					    u_xlat16_18 = u_xlat16_18 * 50.0;
					    u_xlat16_18 = exp2(u_xlat16_18);
					    u_xlat16_5 = u_xlat16_18 * 0.31621623;
					    u_xlat10_18 = texture2D(_MainTex, u_xlat2.xy).x;
					    u_xlat16_18 = u_xlat16_5 * u_xlat10_18;
					    u_xlat10_2.x = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_18 = u_xlat10_2.x * 0.227027029 + u_xlat16_18;
					    u_xlat10_3.xyz = texture2D(_CameraGBufferTexture2, u_xlat1.xy).xyz;
					    u_xlat2.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
					    u_xlatb2 = u_xlat2.x!=0.0;
					    u_xlat2.x = (u_xlatb2) ? -1.0 : -0.0;
					    u_xlat3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat2.xxx;
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_2 = log2(u_xlat16_11);
					    u_xlat16_2 = u_xlat16_2 * 50.0;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat16_11 = u_xlat16_2 * 0.31621623;
					    u_xlat16_5 = u_xlat16_2 * 0.31621623 + u_xlat16_5;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy).x;
					    u_xlat16_18 = u_xlat10_1 * u_xlat16_11 + u_xlat16_18;
					    u_xlat10_3.xyz = texture2D(_CameraGBufferTexture2, u_xlat2.zw).xyz;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat2.zw).x;
					    u_xlat7.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
					    u_xlatb7 = u_xlat7.x!=0.0;
					    u_xlat7.x = (u_xlatb7) ? -1.0 : -0.0;
					    u_xlat2.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat7.xxx;
					    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_7 = log2(u_xlat16_11);
					    u_xlat16_7 = u_xlat16_7 * 50.0;
					    u_xlat16_7 = exp2(u_xlat16_7);
					    u_xlat16_11 = u_xlat16_7 * 0.0702702701;
					    u_xlat16_5 = u_xlat16_7 * 0.0702702701 + u_xlat16_5;
					    u_xlat16_18 = u_xlat10_1 * u_xlat16_11 + u_xlat16_18;
					    u_xlat10_2.xyz = texture2D(_CameraGBufferTexture2, u_xlat1.zw).xyz;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat1.zw).x;
					    u_xlat7.x = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlatb7 = u_xlat7.x!=0.0;
					    u_xlat7.x = (u_xlatb7) ? -1.0 : -0.0;
					    u_xlat7.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat7.xxx;
					    u_xlat2.xyz = u_xlat7.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat7.xxx + u_xlat2.xyz;
					    u_xlat7.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat7.zzz + u_xlat2.xyz;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat7.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_0 = log2(u_xlat16_11);
					    u_xlat16_0 = u_xlat16_0 * 50.0;
					    u_xlat16_0 = exp2(u_xlat16_0);
					    u_xlat16_11 = u_xlat16_0 * 0.0702702701;
					    u_xlat16_5 = u_xlat16_0 * 0.0702702701 + u_xlat16_5;
					    u_xlat16_5 = u_xlat16_5 + 0.227027029;
					    u_xlat16_0 = u_xlat10_1 * u_xlat16_11 + u_xlat16_18;
					    SV_Target0 = vec4(u_xlat16_0) / vec4(u_xlat16_5);
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					uniform lowp sampler2D _CameraGBufferTexture2;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					lowp float u_xlat10_1;
					vec4 u_xlat2;
					mediump float u_xlat16_2;
					lowp vec3 u_xlat10_2;
					bool u_xlatb2;
					vec4 u_xlat3;
					lowp vec3 u_xlat10_3;
					vec3 u_xlat4;
					mediump float u_xlat16_5;
					vec3 u_xlat7;
					mediump float u_xlat16_7;
					bool u_xlatb7;
					mediump float u_xlat16_11;
					float u_xlat18;
					mediump float u_xlat16_18;
					lowp float u_xlat10_18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat18 = dot(u_xlat10_0.xyz, u_xlat10_0.xyz);
					    u_xlatb18 = u_xlat18!=0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : -0.0;
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(_BlurVector.x, _BlurVector.y, _BlurVector.x, _BlurVector.y);
					    u_xlat2 = (-u_xlat1) * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1 * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture2D(_CameraGBufferTexture2, u_xlat2.xy).xyz;
					    u_xlat18 = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
					    u_xlatb18 = u_xlat18!=0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : -0.0;
					    u_xlat3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat18);
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat16_5 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_5 = u_xlat16_5 + 1.0;
					    u_xlat16_5 = u_xlat16_5 * 0.5;
					    u_xlat16_18 = log2(u_xlat16_5);
					    u_xlat16_18 = u_xlat16_18 * 50.0;
					    u_xlat16_18 = exp2(u_xlat16_18);
					    u_xlat16_5 = u_xlat16_18 * 0.31621623;
					    u_xlat10_18 = texture2D(_MainTex, u_xlat2.xy).x;
					    u_xlat16_18 = u_xlat16_5 * u_xlat10_18;
					    u_xlat10_2.x = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_18 = u_xlat10_2.x * 0.227027029 + u_xlat16_18;
					    u_xlat10_3.xyz = texture2D(_CameraGBufferTexture2, u_xlat1.xy).xyz;
					    u_xlat2.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
					    u_xlatb2 = u_xlat2.x!=0.0;
					    u_xlat2.x = (u_xlatb2) ? -1.0 : -0.0;
					    u_xlat3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat2.xxx;
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_2 = log2(u_xlat16_11);
					    u_xlat16_2 = u_xlat16_2 * 50.0;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat16_11 = u_xlat16_2 * 0.31621623;
					    u_xlat16_5 = u_xlat16_2 * 0.31621623 + u_xlat16_5;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy).x;
					    u_xlat16_18 = u_xlat10_1 * u_xlat16_11 + u_xlat16_18;
					    u_xlat10_3.xyz = texture2D(_CameraGBufferTexture2, u_xlat2.zw).xyz;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat2.zw).x;
					    u_xlat7.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
					    u_xlatb7 = u_xlat7.x!=0.0;
					    u_xlat7.x = (u_xlatb7) ? -1.0 : -0.0;
					    u_xlat2.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat7.xxx;
					    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_7 = log2(u_xlat16_11);
					    u_xlat16_7 = u_xlat16_7 * 50.0;
					    u_xlat16_7 = exp2(u_xlat16_7);
					    u_xlat16_11 = u_xlat16_7 * 0.0702702701;
					    u_xlat16_5 = u_xlat16_7 * 0.0702702701 + u_xlat16_5;
					    u_xlat16_18 = u_xlat10_1 * u_xlat16_11 + u_xlat16_18;
					    u_xlat10_2.xyz = texture2D(_CameraGBufferTexture2, u_xlat1.zw).xyz;
					    u_xlat10_1 = texture2D(_MainTex, u_xlat1.zw).x;
					    u_xlat7.x = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlatb7 = u_xlat7.x!=0.0;
					    u_xlat7.x = (u_xlatb7) ? -1.0 : -0.0;
					    u_xlat7.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat7.xxx;
					    u_xlat2.xyz = u_xlat7.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat7.xxx + u_xlat2.xyz;
					    u_xlat7.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat7.zzz + u_xlat2.xyz;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat7.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_0 = log2(u_xlat16_11);
					    u_xlat16_0 = u_xlat16_0 * 50.0;
					    u_xlat16_0 = exp2(u_xlat16_0);
					    u_xlat16_11 = u_xlat16_0 * 0.0702702701;
					    u_xlat16_5 = u_xlat16_0 * 0.0702702701 + u_xlat16_5;
					    u_xlat16_5 = u_xlat16_5 + 0.227027029;
					    u_xlat16_0 = u_xlat10_1 * u_xlat16_11 + u_xlat16_18;
					    SV_Target0 = vec4(u_xlat16_0) / vec4(u_xlat16_5);
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraGBufferTexture2;
					UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump float u_xlat16_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					bool u_xlatb2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_3;
					vec3 u_xlat4;
					mediump float u_xlat16_5;
					vec3 u_xlat7;
					mediump float u_xlat16_7;
					bool u_xlatb7;
					mediump float u_xlat16_11;
					float u_xlat18;
					mediump float u_xlat16_18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat16_0.xyz = texture(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat18!=0.0);
					#else
					    u_xlatb18 = u_xlat18!=0.0;
					#endif
					    u_xlat18 = (u_xlatb18) ? -1.0 : -0.0;
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(_BlurVector.x, _BlurVector.y, _BlurVector.x, _BlurVector.y);
					    u_xlat2 = (-u_xlat1) * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1 * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat16_3.xyz = texture(_CameraGBufferTexture2, u_xlat2.xy).xyz;
					    u_xlat18 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat18!=0.0);
					#else
					    u_xlatb18 = u_xlat18!=0.0;
					#endif
					    u_xlat18 = (u_xlatb18) ? -1.0 : -0.0;
					    u_xlat3.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat18);
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat16_5 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_5 = u_xlat16_5 + 1.0;
					    u_xlat16_5 = u_xlat16_5 * 0.5;
					    u_xlat16_18 = log2(u_xlat16_5);
					    u_xlat16_18 = u_xlat16_18 * 50.0;
					    u_xlat16_18 = exp2(u_xlat16_18);
					    u_xlat16_5 = u_xlat16_18 * 0.31621623;
					    u_xlat16_18 = texture(_MainTex, u_xlat2.xy).x;
					    u_xlat16_18 = u_xlat16_5 * u_xlat16_18;
					    u_xlat16_2.x = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_18 = u_xlat16_2.x * 0.227027029 + u_xlat16_18;
					    u_xlat16_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
					    u_xlat2.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat2.x!=0.0);
					#else
					    u_xlatb2 = u_xlat2.x!=0.0;
					#endif
					    u_xlat2.x = (u_xlatb2) ? -1.0 : -0.0;
					    u_xlat3.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat2.xxx;
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_2.x = log2(u_xlat16_11);
					    u_xlat16_2.x = u_xlat16_2.x * 50.0;
					    u_xlat16_2.x = exp2(u_xlat16_2.x);
					    u_xlat16_11 = u_xlat16_2.x * 0.31621623;
					    u_xlat16_5 = u_xlat16_2.x * 0.31621623 + u_xlat16_5;
					    u_xlat16_1 = texture(_MainTex, u_xlat1.xy).x;
					    u_xlat16_18 = u_xlat16_1 * u_xlat16_11 + u_xlat16_18;
					    u_xlat16_3.xyz = texture(_CameraGBufferTexture2, u_xlat2.zw).xyz;
					    u_xlat16_1 = texture(_MainTex, u_xlat2.zw).x;
					    u_xlat7.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat7.x!=0.0);
					#else
					    u_xlatb7 = u_xlat7.x!=0.0;
					#endif
					    u_xlat7.x = (u_xlatb7) ? -1.0 : -0.0;
					    u_xlat2.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat7.xxx;
					    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_7 = log2(u_xlat16_11);
					    u_xlat16_7 = u_xlat16_7 * 50.0;
					    u_xlat16_7 = exp2(u_xlat16_7);
					    u_xlat16_11 = u_xlat16_7 * 0.0702702701;
					    u_xlat16_5 = u_xlat16_7 * 0.0702702701 + u_xlat16_5;
					    u_xlat16_18 = u_xlat16_1 * u_xlat16_11 + u_xlat16_18;
					    u_xlat16_2.xyz = texture(_CameraGBufferTexture2, u_xlat1.zw).xyz;
					    u_xlat16_1 = texture(_MainTex, u_xlat1.zw).x;
					    u_xlat7.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat7.x!=0.0);
					#else
					    u_xlatb7 = u_xlat7.x!=0.0;
					#endif
					    u_xlat7.x = (u_xlatb7) ? -1.0 : -0.0;
					    u_xlat7.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat7.xxx;
					    u_xlat2.xyz = u_xlat7.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat7.xxx + u_xlat2.xyz;
					    u_xlat7.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat7.zzz + u_xlat2.xyz;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat7.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_0.x = log2(u_xlat16_11);
					    u_xlat16_0.x = u_xlat16_0.x * 50.0;
					    u_xlat16_0.x = exp2(u_xlat16_0.x);
					    u_xlat16_11 = u_xlat16_0.x * 0.0702702701;
					    u_xlat16_5 = u_xlat16_0.x * 0.0702702701 + u_xlat16_5;
					    u_xlat16_5 = u_xlat16_5 + 0.227027029;
					    u_xlat16_0.x = u_xlat16_1 * u_xlat16_11 + u_xlat16_18;
					    SV_Target0 = u_xlat16_0.xxxx / vec4(u_xlat16_5);
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraGBufferTexture2;
					UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump float u_xlat16_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					bool u_xlatb2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_3;
					vec3 u_xlat4;
					mediump float u_xlat16_5;
					vec3 u_xlat7;
					mediump float u_xlat16_7;
					bool u_xlatb7;
					mediump float u_xlat16_11;
					float u_xlat18;
					mediump float u_xlat16_18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat16_0.xyz = texture(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat18!=0.0);
					#else
					    u_xlatb18 = u_xlat18!=0.0;
					#endif
					    u_xlat18 = (u_xlatb18) ? -1.0 : -0.0;
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(_BlurVector.x, _BlurVector.y, _BlurVector.x, _BlurVector.y);
					    u_xlat2 = (-u_xlat1) * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1 * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat16_3.xyz = texture(_CameraGBufferTexture2, u_xlat2.xy).xyz;
					    u_xlat18 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat18!=0.0);
					#else
					    u_xlatb18 = u_xlat18!=0.0;
					#endif
					    u_xlat18 = (u_xlatb18) ? -1.0 : -0.0;
					    u_xlat3.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat18);
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat16_5 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_5 = u_xlat16_5 + 1.0;
					    u_xlat16_5 = u_xlat16_5 * 0.5;
					    u_xlat16_18 = log2(u_xlat16_5);
					    u_xlat16_18 = u_xlat16_18 * 50.0;
					    u_xlat16_18 = exp2(u_xlat16_18);
					    u_xlat16_5 = u_xlat16_18 * 0.31621623;
					    u_xlat16_18 = texture(_MainTex, u_xlat2.xy).x;
					    u_xlat16_18 = u_xlat16_5 * u_xlat16_18;
					    u_xlat16_2.x = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_18 = u_xlat16_2.x * 0.227027029 + u_xlat16_18;
					    u_xlat16_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
					    u_xlat2.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat2.x!=0.0);
					#else
					    u_xlatb2 = u_xlat2.x!=0.0;
					#endif
					    u_xlat2.x = (u_xlatb2) ? -1.0 : -0.0;
					    u_xlat3.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat2.xxx;
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_2.x = log2(u_xlat16_11);
					    u_xlat16_2.x = u_xlat16_2.x * 50.0;
					    u_xlat16_2.x = exp2(u_xlat16_2.x);
					    u_xlat16_11 = u_xlat16_2.x * 0.31621623;
					    u_xlat16_5 = u_xlat16_2.x * 0.31621623 + u_xlat16_5;
					    u_xlat16_1 = texture(_MainTex, u_xlat1.xy).x;
					    u_xlat16_18 = u_xlat16_1 * u_xlat16_11 + u_xlat16_18;
					    u_xlat16_3.xyz = texture(_CameraGBufferTexture2, u_xlat2.zw).xyz;
					    u_xlat16_1 = texture(_MainTex, u_xlat2.zw).x;
					    u_xlat7.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat7.x!=0.0);
					#else
					    u_xlatb7 = u_xlat7.x!=0.0;
					#endif
					    u_xlat7.x = (u_xlatb7) ? -1.0 : -0.0;
					    u_xlat2.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat7.xxx;
					    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_7 = log2(u_xlat16_11);
					    u_xlat16_7 = u_xlat16_7 * 50.0;
					    u_xlat16_7 = exp2(u_xlat16_7);
					    u_xlat16_11 = u_xlat16_7 * 0.0702702701;
					    u_xlat16_5 = u_xlat16_7 * 0.0702702701 + u_xlat16_5;
					    u_xlat16_18 = u_xlat16_1 * u_xlat16_11 + u_xlat16_18;
					    u_xlat16_2.xyz = texture(_CameraGBufferTexture2, u_xlat1.zw).xyz;
					    u_xlat16_1 = texture(_MainTex, u_xlat1.zw).x;
					    u_xlat7.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat7.x!=0.0);
					#else
					    u_xlatb7 = u_xlat7.x!=0.0;
					#endif
					    u_xlat7.x = (u_xlatb7) ? -1.0 : -0.0;
					    u_xlat7.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat7.xxx;
					    u_xlat2.xyz = u_xlat7.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat7.xxx + u_xlat2.xyz;
					    u_xlat7.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat7.zzz + u_xlat2.xyz;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat7.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_0.x = log2(u_xlat16_11);
					    u_xlat16_0.x = u_xlat16_0.x * 50.0;
					    u_xlat16_0.x = exp2(u_xlat16_0.x);
					    u_xlat16_11 = u_xlat16_0.x * 0.0702702701;
					    u_xlat16_5 = u_xlat16_0.x * 0.0702702701 + u_xlat16_5;
					    u_xlat16_5 = u_xlat16_5 + 0.227027029;
					    u_xlat16_0.x = u_xlat16_1 * u_xlat16_11 + u_xlat16_18;
					    SV_Target0 = u_xlat16_0.xxxx / vec4(u_xlat16_5);
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraGBufferTexture2;
					UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump float u_xlat16_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					bool u_xlatb2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_3;
					vec3 u_xlat4;
					mediump float u_xlat16_5;
					vec3 u_xlat7;
					mediump float u_xlat16_7;
					bool u_xlatb7;
					mediump float u_xlat16_11;
					float u_xlat18;
					mediump float u_xlat16_18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat16_0.xyz = texture(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat18!=0.0);
					#else
					    u_xlatb18 = u_xlat18!=0.0;
					#endif
					    u_xlat18 = (u_xlatb18) ? -1.0 : -0.0;
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat18);
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(_BlurVector.x, _BlurVector.y, _BlurVector.x, _BlurVector.y);
					    u_xlat2 = (-u_xlat1) * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1 * vec4(1.38461542, 1.38461542, 3.23076916, 3.23076916) + vs_TEXCOORD0.xyxy;
					    u_xlat16_3.xyz = texture(_CameraGBufferTexture2, u_xlat2.xy).xyz;
					    u_xlat18 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat18!=0.0);
					#else
					    u_xlatb18 = u_xlat18!=0.0;
					#endif
					    u_xlat18 = (u_xlatb18) ? -1.0 : -0.0;
					    u_xlat3.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat18);
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat16_5 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_5 = u_xlat16_5 + 1.0;
					    u_xlat16_5 = u_xlat16_5 * 0.5;
					    u_xlat16_18 = log2(u_xlat16_5);
					    u_xlat16_18 = u_xlat16_18 * 50.0;
					    u_xlat16_18 = exp2(u_xlat16_18);
					    u_xlat16_5 = u_xlat16_18 * 0.31621623;
					    u_xlat16_18 = texture(_MainTex, u_xlat2.xy).x;
					    u_xlat16_18 = u_xlat16_5 * u_xlat16_18;
					    u_xlat16_2.x = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_18 = u_xlat16_2.x * 0.227027029 + u_xlat16_18;
					    u_xlat16_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
					    u_xlat2.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat2.x!=0.0);
					#else
					    u_xlatb2 = u_xlat2.x!=0.0;
					#endif
					    u_xlat2.x = (u_xlatb2) ? -1.0 : -0.0;
					    u_xlat3.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat2.xxx;
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_2.x = log2(u_xlat16_11);
					    u_xlat16_2.x = u_xlat16_2.x * 50.0;
					    u_xlat16_2.x = exp2(u_xlat16_2.x);
					    u_xlat16_11 = u_xlat16_2.x * 0.31621623;
					    u_xlat16_5 = u_xlat16_2.x * 0.31621623 + u_xlat16_5;
					    u_xlat16_1 = texture(_MainTex, u_xlat1.xy).x;
					    u_xlat16_18 = u_xlat16_1 * u_xlat16_11 + u_xlat16_18;
					    u_xlat16_3.xyz = texture(_CameraGBufferTexture2, u_xlat2.zw).xyz;
					    u_xlat16_1 = texture(_MainTex, u_xlat2.zw).x;
					    u_xlat7.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat7.x!=0.0);
					#else
					    u_xlatb7 = u_xlat7.x!=0.0;
					#endif
					    u_xlat7.x = (u_xlatb7) ? -1.0 : -0.0;
					    u_xlat2.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat7.xxx;
					    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_7 = log2(u_xlat16_11);
					    u_xlat16_7 = u_xlat16_7 * 50.0;
					    u_xlat16_7 = exp2(u_xlat16_7);
					    u_xlat16_11 = u_xlat16_7 * 0.0702702701;
					    u_xlat16_5 = u_xlat16_7 * 0.0702702701 + u_xlat16_5;
					    u_xlat16_18 = u_xlat16_1 * u_xlat16_11 + u_xlat16_18;
					    u_xlat16_2.xyz = texture(_CameraGBufferTexture2, u_xlat1.zw).xyz;
					    u_xlat16_1 = texture(_MainTex, u_xlat1.zw).x;
					    u_xlat7.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat7.x!=0.0);
					#else
					    u_xlatb7 = u_xlat7.x!=0.0;
					#endif
					    u_xlat7.x = (u_xlatb7) ? -1.0 : -0.0;
					    u_xlat7.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat7.xxx;
					    u_xlat2.xyz = u_xlat7.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat7.xxx + u_xlat2.xyz;
					    u_xlat7.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat7.zzz + u_xlat2.xyz;
					    u_xlat16_11 = dot(u_xlat0.xyz, u_xlat7.xyz);
					    u_xlat16_11 = u_xlat16_11 + 1.0;
					    u_xlat16_11 = u_xlat16_11 * 0.5;
					    u_xlat16_0.x = log2(u_xlat16_11);
					    u_xlat16_0.x = u_xlat16_0.x * 50.0;
					    u_xlat16_0.x = exp2(u_xlat16_0.x);
					    u_xlat16_11 = u_xlat16_0.x * 0.0702702701;
					    u_xlat16_5 = u_xlat16_0.x * 0.0702702701 + u_xlat16_5;
					    u_xlat16_5 = u_xlat16_5 + 0.227027029;
					    u_xlat16_0.x = u_xlat16_1 * u_xlat16_11 + u_xlat16_18;
					    SV_Target0 = u_xlat16_0.xxxx / vec4(u_xlat16_5);
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 376517
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					uniform lowp sampler2D _CameraDepthNormalsTexture;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					mediump float u_xlat16_0;
					lowp float u_xlat10_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					mediump float u_xlat16_3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_4;
					lowp float u_xlat10_4;
					mediump float u_xlat16_7;
					mediump float u_xlat16_8;
					lowp float u_xlat10_8;
					mediump float u_xlat16_9;
					mediump float u_xlat16_12;
					void main()
					{
					    u_xlat0.xy = (-_MainTex_TexelSize.xy) * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat0.xy).xyz;
					    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy).x;
					    u_xlat16_4.xyz = u_xlat10_1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_12 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
					    u_xlat16_12 = 2.0 / u_xlat16_12;
					    u_xlat1.xy = u_xlat16_4.xy * vec2(u_xlat16_12);
					    u_xlat1.z = u_xlat16_12 + -1.0;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat10_1.xyz = texture2D(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_9 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					    u_xlat16_9 = 2.0 / u_xlat16_9;
					    u_xlat2.xy = u_xlat16_1.xy * vec2(u_xlat16_9);
					    u_xlat2.z = u_xlat16_9 + -1.0;
					    u_xlat1.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_3 = dot(u_xlat1.xyz, u_xlat4.xyz);
					    u_xlat16_3 = u_xlat16_3 + 1.0;
					    u_xlat16_3 = u_xlat16_3 * 0.5;
					    u_xlat16_4.x = log2(u_xlat16_3);
					    u_xlat16_4.x = u_xlat16_4.x * 50.0;
					    u_xlat16_4.x = exp2(u_xlat16_4.x);
					    u_xlat10_8 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_8 = u_xlat10_8 + u_xlat10_8;
					    u_xlat16_0 = u_xlat10_0 * u_xlat16_4.x + u_xlat16_8;
					    u_xlat16_3 = u_xlat16_4.x + 2.0;
					    u_xlat4.xy = _MainTex_TexelSize.xy * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat10_2.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat4.xy).xyz;
					    u_xlat10_4 = texture2D(_MainTex, u_xlat4.xy).x;
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_8 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_8 = 2.0 / u_xlat16_8;
					    u_xlat2.xy = u_xlat16_2.xy * vec2(u_xlat16_8);
					    u_xlat2.z = u_xlat16_8 + -1.0;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_7 = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat16_7 = u_xlat16_7 + 1.0;
					    u_xlat16_7 = u_xlat16_7 * 0.5;
					    u_xlat16_8 = log2(u_xlat16_7);
					    u_xlat16_8 = u_xlat16_8 * 50.0;
					    u_xlat16_8 = exp2(u_xlat16_8);
					    u_xlat16_0 = u_xlat10_4 * u_xlat16_8 + u_xlat16_0;
					    u_xlat16_3 = u_xlat16_8 + u_xlat16_3;
					    SV_Target0 = vec4(u_xlat16_0) / vec4(u_xlat16_3);
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					uniform lowp sampler2D _CameraDepthNormalsTexture;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					mediump float u_xlat16_0;
					lowp float u_xlat10_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					mediump float u_xlat16_3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_4;
					lowp float u_xlat10_4;
					mediump float u_xlat16_7;
					mediump float u_xlat16_8;
					lowp float u_xlat10_8;
					mediump float u_xlat16_9;
					mediump float u_xlat16_12;
					void main()
					{
					    u_xlat0.xy = (-_MainTex_TexelSize.xy) * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat0.xy).xyz;
					    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy).x;
					    u_xlat16_4.xyz = u_xlat10_1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_12 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
					    u_xlat16_12 = 2.0 / u_xlat16_12;
					    u_xlat1.xy = u_xlat16_4.xy * vec2(u_xlat16_12);
					    u_xlat1.z = u_xlat16_12 + -1.0;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat10_1.xyz = texture2D(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_9 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					    u_xlat16_9 = 2.0 / u_xlat16_9;
					    u_xlat2.xy = u_xlat16_1.xy * vec2(u_xlat16_9);
					    u_xlat2.z = u_xlat16_9 + -1.0;
					    u_xlat1.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_3 = dot(u_xlat1.xyz, u_xlat4.xyz);
					    u_xlat16_3 = u_xlat16_3 + 1.0;
					    u_xlat16_3 = u_xlat16_3 * 0.5;
					    u_xlat16_4.x = log2(u_xlat16_3);
					    u_xlat16_4.x = u_xlat16_4.x * 50.0;
					    u_xlat16_4.x = exp2(u_xlat16_4.x);
					    u_xlat10_8 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_8 = u_xlat10_8 + u_xlat10_8;
					    u_xlat16_0 = u_xlat10_0 * u_xlat16_4.x + u_xlat16_8;
					    u_xlat16_3 = u_xlat16_4.x + 2.0;
					    u_xlat4.xy = _MainTex_TexelSize.xy * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat10_2.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat4.xy).xyz;
					    u_xlat10_4 = texture2D(_MainTex, u_xlat4.xy).x;
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_8 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_8 = 2.0 / u_xlat16_8;
					    u_xlat2.xy = u_xlat16_2.xy * vec2(u_xlat16_8);
					    u_xlat2.z = u_xlat16_8 + -1.0;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_7 = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat16_7 = u_xlat16_7 + 1.0;
					    u_xlat16_7 = u_xlat16_7 * 0.5;
					    u_xlat16_8 = log2(u_xlat16_7);
					    u_xlat16_8 = u_xlat16_8 * 50.0;
					    u_xlat16_8 = exp2(u_xlat16_8);
					    u_xlat16_0 = u_xlat10_4 * u_xlat16_8 + u_xlat16_0;
					    u_xlat16_3 = u_xlat16_8 + u_xlat16_3;
					    SV_Target0 = vec4(u_xlat16_0) / vec4(u_xlat16_3);
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					uniform lowp sampler2D _CameraDepthNormalsTexture;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					mediump float u_xlat16_0;
					lowp float u_xlat10_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					mediump float u_xlat16_3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_4;
					lowp float u_xlat10_4;
					mediump float u_xlat16_7;
					mediump float u_xlat16_8;
					lowp float u_xlat10_8;
					mediump float u_xlat16_9;
					mediump float u_xlat16_12;
					void main()
					{
					    u_xlat0.xy = (-_MainTex_TexelSize.xy) * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat0.xy).xyz;
					    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy).x;
					    u_xlat16_4.xyz = u_xlat10_1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_12 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
					    u_xlat16_12 = 2.0 / u_xlat16_12;
					    u_xlat1.xy = u_xlat16_4.xy * vec2(u_xlat16_12);
					    u_xlat1.z = u_xlat16_12 + -1.0;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat10_1.xyz = texture2D(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_9 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					    u_xlat16_9 = 2.0 / u_xlat16_9;
					    u_xlat2.xy = u_xlat16_1.xy * vec2(u_xlat16_9);
					    u_xlat2.z = u_xlat16_9 + -1.0;
					    u_xlat1.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_3 = dot(u_xlat1.xyz, u_xlat4.xyz);
					    u_xlat16_3 = u_xlat16_3 + 1.0;
					    u_xlat16_3 = u_xlat16_3 * 0.5;
					    u_xlat16_4.x = log2(u_xlat16_3);
					    u_xlat16_4.x = u_xlat16_4.x * 50.0;
					    u_xlat16_4.x = exp2(u_xlat16_4.x);
					    u_xlat10_8 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_8 = u_xlat10_8 + u_xlat10_8;
					    u_xlat16_0 = u_xlat10_0 * u_xlat16_4.x + u_xlat16_8;
					    u_xlat16_3 = u_xlat16_4.x + 2.0;
					    u_xlat4.xy = _MainTex_TexelSize.xy * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat10_2.xyz = texture2D(_CameraDepthNormalsTexture, u_xlat4.xy).xyz;
					    u_xlat10_4 = texture2D(_MainTex, u_xlat4.xy).x;
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_8 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_8 = 2.0 / u_xlat16_8;
					    u_xlat2.xy = u_xlat16_2.xy * vec2(u_xlat16_8);
					    u_xlat2.z = u_xlat16_8 + -1.0;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_7 = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat16_7 = u_xlat16_7 + 1.0;
					    u_xlat16_7 = u_xlat16_7 * 0.5;
					    u_xlat16_8 = log2(u_xlat16_7);
					    u_xlat16_8 = u_xlat16_8 * 50.0;
					    u_xlat16_8 = exp2(u_xlat16_8);
					    u_xlat16_0 = u_xlat10_4 * u_xlat16_8 + u_xlat16_0;
					    u_xlat16_3 = u_xlat16_8 + u_xlat16_3;
					    SV_Target0 = vec4(u_xlat16_0) / vec4(u_xlat16_3);
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraDepthNormalsTexture;
					UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump float u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					mediump vec3 u_xlat16_2;
					mediump float u_xlat16_3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_7;
					mediump float u_xlat16_8;
					mediump float u_xlat16_9;
					mediump float u_xlat16_12;
					void main()
					{
					    u_xlat0.xy = (-_MainTex_TexelSize.xy) * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat16_1.xyz = texture(_CameraDepthNormalsTexture, u_xlat0.xy).xyz;
					    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
					    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_12 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
					    u_xlat16_12 = 2.0 / u_xlat16_12;
					    u_xlat1.xy = u_xlat16_4.xy * vec2(u_xlat16_12);
					    u_xlat1.z = u_xlat16_12 + -1.0;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_1.xyz = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_9 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					    u_xlat16_9 = 2.0 / u_xlat16_9;
					    u_xlat2.xy = u_xlat16_1.xy * vec2(u_xlat16_9);
					    u_xlat2.z = u_xlat16_9 + -1.0;
					    u_xlat1.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_3 = dot(u_xlat1.xyz, u_xlat4.xyz);
					    u_xlat16_3 = u_xlat16_3 + 1.0;
					    u_xlat16_3 = u_xlat16_3 * 0.5;
					    u_xlat16_4.x = log2(u_xlat16_3);
					    u_xlat16_4.x = u_xlat16_4.x * 50.0;
					    u_xlat16_4.x = exp2(u_xlat16_4.x);
					    u_xlat16_8 = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_8 = u_xlat16_8 + u_xlat16_8;
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.x + u_xlat16_8;
					    u_xlat16_3 = u_xlat16_4.x + 2.0;
					    u_xlat4.xy = _MainTex_TexelSize.xy * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat16_2.xyz = texture(_CameraDepthNormalsTexture, u_xlat4.xy).xyz;
					    u_xlat16_4.x = texture(_MainTex, u_xlat4.xy).x;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_8 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_8 = 2.0 / u_xlat16_8;
					    u_xlat2.xy = u_xlat16_2.xy * vec2(u_xlat16_8);
					    u_xlat2.z = u_xlat16_8 + -1.0;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_7 = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat16_7 = u_xlat16_7 + 1.0;
					    u_xlat16_7 = u_xlat16_7 * 0.5;
					    u_xlat16_8 = log2(u_xlat16_7);
					    u_xlat16_8 = u_xlat16_8 * 50.0;
					    u_xlat16_8 = exp2(u_xlat16_8);
					    u_xlat16_0 = u_xlat16_4.x * u_xlat16_8 + u_xlat16_0;
					    u_xlat16_3 = u_xlat16_8 + u_xlat16_3;
					    SV_Target0 = vec4(u_xlat16_0) / vec4(u_xlat16_3);
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraDepthNormalsTexture;
					UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump float u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					mediump vec3 u_xlat16_2;
					mediump float u_xlat16_3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_7;
					mediump float u_xlat16_8;
					mediump float u_xlat16_9;
					mediump float u_xlat16_12;
					void main()
					{
					    u_xlat0.xy = (-_MainTex_TexelSize.xy) * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat16_1.xyz = texture(_CameraDepthNormalsTexture, u_xlat0.xy).xyz;
					    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
					    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_12 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
					    u_xlat16_12 = 2.0 / u_xlat16_12;
					    u_xlat1.xy = u_xlat16_4.xy * vec2(u_xlat16_12);
					    u_xlat1.z = u_xlat16_12 + -1.0;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_1.xyz = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_9 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					    u_xlat16_9 = 2.0 / u_xlat16_9;
					    u_xlat2.xy = u_xlat16_1.xy * vec2(u_xlat16_9);
					    u_xlat2.z = u_xlat16_9 + -1.0;
					    u_xlat1.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_3 = dot(u_xlat1.xyz, u_xlat4.xyz);
					    u_xlat16_3 = u_xlat16_3 + 1.0;
					    u_xlat16_3 = u_xlat16_3 * 0.5;
					    u_xlat16_4.x = log2(u_xlat16_3);
					    u_xlat16_4.x = u_xlat16_4.x * 50.0;
					    u_xlat16_4.x = exp2(u_xlat16_4.x);
					    u_xlat16_8 = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_8 = u_xlat16_8 + u_xlat16_8;
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.x + u_xlat16_8;
					    u_xlat16_3 = u_xlat16_4.x + 2.0;
					    u_xlat4.xy = _MainTex_TexelSize.xy * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat16_2.xyz = texture(_CameraDepthNormalsTexture, u_xlat4.xy).xyz;
					    u_xlat16_4.x = texture(_MainTex, u_xlat4.xy).x;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_8 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_8 = 2.0 / u_xlat16_8;
					    u_xlat2.xy = u_xlat16_2.xy * vec2(u_xlat16_8);
					    u_xlat2.z = u_xlat16_8 + -1.0;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_7 = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat16_7 = u_xlat16_7 + 1.0;
					    u_xlat16_7 = u_xlat16_7 * 0.5;
					    u_xlat16_8 = log2(u_xlat16_7);
					    u_xlat16_8 = u_xlat16_8 * 50.0;
					    u_xlat16_8 = exp2(u_xlat16_8);
					    u_xlat16_0 = u_xlat16_4.x * u_xlat16_8 + u_xlat16_0;
					    u_xlat16_3 = u_xlat16_8 + u_xlat16_3;
					    SV_Target0 = vec4(u_xlat16_0) / vec4(u_xlat16_3);
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraDepthNormalsTexture;
					UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump float u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					mediump vec3 u_xlat16_2;
					mediump float u_xlat16_3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_7;
					mediump float u_xlat16_8;
					mediump float u_xlat16_9;
					mediump float u_xlat16_12;
					void main()
					{
					    u_xlat0.xy = (-_MainTex_TexelSize.xy) * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat16_1.xyz = texture(_CameraDepthNormalsTexture, u_xlat0.xy).xyz;
					    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
					    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_12 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
					    u_xlat16_12 = 2.0 / u_xlat16_12;
					    u_xlat1.xy = u_xlat16_4.xy * vec2(u_xlat16_12);
					    u_xlat1.z = u_xlat16_12 + -1.0;
					    u_xlat4.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_1.xyz = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_9 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					    u_xlat16_9 = 2.0 / u_xlat16_9;
					    u_xlat2.xy = u_xlat16_1.xy * vec2(u_xlat16_9);
					    u_xlat2.z = u_xlat16_9 + -1.0;
					    u_xlat1.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_3 = dot(u_xlat1.xyz, u_xlat4.xyz);
					    u_xlat16_3 = u_xlat16_3 + 1.0;
					    u_xlat16_3 = u_xlat16_3 * 0.5;
					    u_xlat16_4.x = log2(u_xlat16_3);
					    u_xlat16_4.x = u_xlat16_4.x * 50.0;
					    u_xlat16_4.x = exp2(u_xlat16_4.x);
					    u_xlat16_8 = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_8 = u_xlat16_8 + u_xlat16_8;
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.x + u_xlat16_8;
					    u_xlat16_3 = u_xlat16_4.x + 2.0;
					    u_xlat4.xy = _MainTex_TexelSize.xy * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat16_2.xyz = texture(_CameraDepthNormalsTexture, u_xlat4.xy).xyz;
					    u_xlat16_4.x = texture(_MainTex, u_xlat4.xy).x;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_8 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_8 = 2.0 / u_xlat16_8;
					    u_xlat2.xy = u_xlat16_2.xy * vec2(u_xlat16_8);
					    u_xlat2.z = u_xlat16_8 + -1.0;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16_7 = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat16_7 = u_xlat16_7 + 1.0;
					    u_xlat16_7 = u_xlat16_7 * 0.5;
					    u_xlat16_8 = log2(u_xlat16_7);
					    u_xlat16_8 = u_xlat16_8 * 50.0;
					    u_xlat16_8 = exp2(u_xlat16_8);
					    u_xlat16_0 = u_xlat16_4.x * u_xlat16_8 + u_xlat16_0;
					    u_xlat16_3 = u_xlat16_8 + u_xlat16_3;
					    SV_Target0 = vec4(u_xlat16_0) / vec4(u_xlat16_3);
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 404288
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					uniform lowp sampler2D _CameraGBufferTexture2;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					mediump float u_xlat16_0;
					lowp float u_xlat10_0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec3 u_xlat10_2;
					mediump float u_xlat16_3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					mediump float u_xlat16_5;
					lowp float u_xlat10_5;
					bool u_xlatb5;
					mediump float u_xlat16_8;
					float u_xlat10;
					mediump float u_xlat16_10;
					lowp float u_xlat10_10;
					bool u_xlatb10;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
					    u_xlat0.xy = (-_MainTex_TexelSize.xy) * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture2D(_CameraGBufferTexture2, u_xlat0.xy).xyz;
					    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy).x;
					    u_xlat5.x = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlatb5 = u_xlat5.x!=0.0;
					    u_xlat5.x = (u_xlatb5) ? -1.0 : -0.0;
					    u_xlat5.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat5.xxx;
					    u_xlat1.xyz = u_xlat5.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat5.xxx + u_xlat1.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat5.zzz + u_xlat1.xyz;
					    u_xlat10_1.xyz = texture2D(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat16 = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlatb16 = u_xlat16!=0.0;
					    u_xlat16 = (u_xlatb16) ? -1.0 : -0.0;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat16);
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16_3 = dot(u_xlat1.xyz, u_xlat5.xyz);
					    u_xlat16_3 = u_xlat16_3 + 1.0;
					    u_xlat16_3 = u_xlat16_3 * 0.5;
					    u_xlat16_5 = log2(u_xlat16_3);
					    u_xlat16_5 = u_xlat16_5 * 50.0;
					    u_xlat16_5 = exp2(u_xlat16_5);
					    u_xlat10_10 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_10 = u_xlat10_10 + u_xlat10_10;
					    u_xlat16_0 = u_xlat10_0 * u_xlat16_5 + u_xlat16_10;
					    u_xlat16_3 = u_xlat16_5 + 2.0;
					    u_xlat5.xy = _MainTex_TexelSize.xy * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat10_2.xyz = texture2D(_CameraGBufferTexture2, u_xlat5.xy).xyz;
					    u_xlat10_5 = texture2D(_MainTex, u_xlat5.xy).x;
					    u_xlat10 = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlatb10 = u_xlat10!=0.0;
					    u_xlat10 = (u_xlatb10) ? -1.0 : -0.0;
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat10);
					    u_xlat4.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat2.xxx + u_xlat4.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat16_8 = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat16_8 = u_xlat16_8 + 1.0;
					    u_xlat16_8 = u_xlat16_8 * 0.5;
					    u_xlat16_10 = log2(u_xlat16_8);
					    u_xlat16_10 = u_xlat16_10 * 50.0;
					    u_xlat16_10 = exp2(u_xlat16_10);
					    u_xlat16_0 = u_xlat10_5 * u_xlat16_10 + u_xlat16_0;
					    u_xlat16_3 = u_xlat16_10 + u_xlat16_3;
					    SV_Target0 = vec4(u_xlat16_0) / vec4(u_xlat16_3);
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					uniform lowp sampler2D _CameraGBufferTexture2;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					mediump float u_xlat16_0;
					lowp float u_xlat10_0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec3 u_xlat10_2;
					mediump float u_xlat16_3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					mediump float u_xlat16_5;
					lowp float u_xlat10_5;
					bool u_xlatb5;
					mediump float u_xlat16_8;
					float u_xlat10;
					mediump float u_xlat16_10;
					lowp float u_xlat10_10;
					bool u_xlatb10;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
					    u_xlat0.xy = (-_MainTex_TexelSize.xy) * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture2D(_CameraGBufferTexture2, u_xlat0.xy).xyz;
					    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy).x;
					    u_xlat5.x = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlatb5 = u_xlat5.x!=0.0;
					    u_xlat5.x = (u_xlatb5) ? -1.0 : -0.0;
					    u_xlat5.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat5.xxx;
					    u_xlat1.xyz = u_xlat5.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat5.xxx + u_xlat1.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat5.zzz + u_xlat1.xyz;
					    u_xlat10_1.xyz = texture2D(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat16 = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlatb16 = u_xlat16!=0.0;
					    u_xlat16 = (u_xlatb16) ? -1.0 : -0.0;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat16);
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16_3 = dot(u_xlat1.xyz, u_xlat5.xyz);
					    u_xlat16_3 = u_xlat16_3 + 1.0;
					    u_xlat16_3 = u_xlat16_3 * 0.5;
					    u_xlat16_5 = log2(u_xlat16_3);
					    u_xlat16_5 = u_xlat16_5 * 50.0;
					    u_xlat16_5 = exp2(u_xlat16_5);
					    u_xlat10_10 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_10 = u_xlat10_10 + u_xlat10_10;
					    u_xlat16_0 = u_xlat10_0 * u_xlat16_5 + u_xlat16_10;
					    u_xlat16_3 = u_xlat16_5 + 2.0;
					    u_xlat5.xy = _MainTex_TexelSize.xy * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat10_2.xyz = texture2D(_CameraGBufferTexture2, u_xlat5.xy).xyz;
					    u_xlat10_5 = texture2D(_MainTex, u_xlat5.xy).x;
					    u_xlat10 = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlatb10 = u_xlat10!=0.0;
					    u_xlat10 = (u_xlatb10) ? -1.0 : -0.0;
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat10);
					    u_xlat4.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat2.xxx + u_xlat4.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat16_8 = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat16_8 = u_xlat16_8 + 1.0;
					    u_xlat16_8 = u_xlat16_8 * 0.5;
					    u_xlat16_10 = log2(u_xlat16_8);
					    u_xlat16_10 = u_xlat16_10 * 50.0;
					    u_xlat16_10 = exp2(u_xlat16_10);
					    u_xlat16_0 = u_xlat10_5 * u_xlat16_10 + u_xlat16_0;
					    u_xlat16_3 = u_xlat16_10 + u_xlat16_3;
					    SV_Target0 = vec4(u_xlat16_0) / vec4(u_xlat16_3);
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					uniform lowp sampler2D _CameraGBufferTexture2;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					mediump float u_xlat16_0;
					lowp float u_xlat10_0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec3 u_xlat10_2;
					mediump float u_xlat16_3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					mediump float u_xlat16_5;
					lowp float u_xlat10_5;
					bool u_xlatb5;
					mediump float u_xlat16_8;
					float u_xlat10;
					mediump float u_xlat16_10;
					lowp float u_xlat10_10;
					bool u_xlatb10;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
					    u_xlat0.xy = (-_MainTex_TexelSize.xy) * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture2D(_CameraGBufferTexture2, u_xlat0.xy).xyz;
					    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy).x;
					    u_xlat5.x = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlatb5 = u_xlat5.x!=0.0;
					    u_xlat5.x = (u_xlatb5) ? -1.0 : -0.0;
					    u_xlat5.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat5.xxx;
					    u_xlat1.xyz = u_xlat5.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat5.xxx + u_xlat1.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat5.zzz + u_xlat1.xyz;
					    u_xlat10_1.xyz = texture2D(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat16 = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlatb16 = u_xlat16!=0.0;
					    u_xlat16 = (u_xlatb16) ? -1.0 : -0.0;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat16);
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16_3 = dot(u_xlat1.xyz, u_xlat5.xyz);
					    u_xlat16_3 = u_xlat16_3 + 1.0;
					    u_xlat16_3 = u_xlat16_3 * 0.5;
					    u_xlat16_5 = log2(u_xlat16_3);
					    u_xlat16_5 = u_xlat16_5 * 50.0;
					    u_xlat16_5 = exp2(u_xlat16_5);
					    u_xlat10_10 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_10 = u_xlat10_10 + u_xlat10_10;
					    u_xlat16_0 = u_xlat10_0 * u_xlat16_5 + u_xlat16_10;
					    u_xlat16_3 = u_xlat16_5 + 2.0;
					    u_xlat5.xy = _MainTex_TexelSize.xy * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat10_2.xyz = texture2D(_CameraGBufferTexture2, u_xlat5.xy).xyz;
					    u_xlat10_5 = texture2D(_MainTex, u_xlat5.xy).x;
					    u_xlat10 = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlatb10 = u_xlat10!=0.0;
					    u_xlat10 = (u_xlatb10) ? -1.0 : -0.0;
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat10);
					    u_xlat4.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat2.xxx + u_xlat4.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat16_8 = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat16_8 = u_xlat16_8 + 1.0;
					    u_xlat16_8 = u_xlat16_8 * 0.5;
					    u_xlat16_10 = log2(u_xlat16_8);
					    u_xlat16_10 = u_xlat16_10 * 50.0;
					    u_xlat16_10 = exp2(u_xlat16_10);
					    u_xlat16_0 = u_xlat10_5 * u_xlat16_10 + u_xlat16_0;
					    u_xlat16_3 = u_xlat16_10 + u_xlat16_3;
					    SV_Target0 = vec4(u_xlat16_0) / vec4(u_xlat16_3);
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraGBufferTexture2;
					UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump float u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					mediump float u_xlat16_3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					mediump float u_xlat16_5;
					bool u_xlatb5;
					mediump float u_xlat16_8;
					float u_xlat10;
					mediump float u_xlat16_10;
					bool u_xlatb10;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
					    u_xlat0.xy = (-_MainTex_TexelSize.xy) * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat16_1.xyz = texture(_CameraGBufferTexture2, u_xlat0.xy).xyz;
					    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
					    u_xlat5.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb5 = !!(u_xlat5.x!=0.0);
					#else
					    u_xlatb5 = u_xlat5.x!=0.0;
					#endif
					    u_xlat5.x = (u_xlatb5) ? -1.0 : -0.0;
					    u_xlat5.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat5.xxx;
					    u_xlat1.xyz = u_xlat5.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat5.xxx + u_xlat1.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat5.zzz + u_xlat1.xyz;
					    u_xlat16_1.xyz = texture(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat16 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(u_xlat16!=0.0);
					#else
					    u_xlatb16 = u_xlat16!=0.0;
					#endif
					    u_xlat16 = (u_xlatb16) ? -1.0 : -0.0;
					    u_xlat1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat16);
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16_3 = dot(u_xlat1.xyz, u_xlat5.xyz);
					    u_xlat16_3 = u_xlat16_3 + 1.0;
					    u_xlat16_3 = u_xlat16_3 * 0.5;
					    u_xlat16_5 = log2(u_xlat16_3);
					    u_xlat16_5 = u_xlat16_5 * 50.0;
					    u_xlat16_5 = exp2(u_xlat16_5);
					    u_xlat16_10 = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_10 = u_xlat16_10 + u_xlat16_10;
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_5 + u_xlat16_10;
					    u_xlat16_3 = u_xlat16_5 + 2.0;
					    u_xlat5.xy = _MainTex_TexelSize.xy * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat16_2.xyz = texture(_CameraGBufferTexture2, u_xlat5.xy).xyz;
					    u_xlat16_5 = texture(_MainTex, u_xlat5.xy).x;
					    u_xlat10 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb10 = !!(u_xlat10!=0.0);
					#else
					    u_xlatb10 = u_xlat10!=0.0;
					#endif
					    u_xlat10 = (u_xlatb10) ? -1.0 : -0.0;
					    u_xlat2.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat10);
					    u_xlat4.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat2.xxx + u_xlat4.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat16_8 = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat16_8 = u_xlat16_8 + 1.0;
					    u_xlat16_8 = u_xlat16_8 * 0.5;
					    u_xlat16_10 = log2(u_xlat16_8);
					    u_xlat16_10 = u_xlat16_10 * 50.0;
					    u_xlat16_10 = exp2(u_xlat16_10);
					    u_xlat16_0 = u_xlat16_5 * u_xlat16_10 + u_xlat16_0;
					    u_xlat16_3 = u_xlat16_10 + u_xlat16_3;
					    SV_Target0 = vec4(u_xlat16_0) / vec4(u_xlat16_3);
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraGBufferTexture2;
					UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump float u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					mediump float u_xlat16_3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					mediump float u_xlat16_5;
					bool u_xlatb5;
					mediump float u_xlat16_8;
					float u_xlat10;
					mediump float u_xlat16_10;
					bool u_xlatb10;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
					    u_xlat0.xy = (-_MainTex_TexelSize.xy) * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat16_1.xyz = texture(_CameraGBufferTexture2, u_xlat0.xy).xyz;
					    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
					    u_xlat5.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb5 = !!(u_xlat5.x!=0.0);
					#else
					    u_xlatb5 = u_xlat5.x!=0.0;
					#endif
					    u_xlat5.x = (u_xlatb5) ? -1.0 : -0.0;
					    u_xlat5.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat5.xxx;
					    u_xlat1.xyz = u_xlat5.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat5.xxx + u_xlat1.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat5.zzz + u_xlat1.xyz;
					    u_xlat16_1.xyz = texture(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat16 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(u_xlat16!=0.0);
					#else
					    u_xlatb16 = u_xlat16!=0.0;
					#endif
					    u_xlat16 = (u_xlatb16) ? -1.0 : -0.0;
					    u_xlat1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat16);
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16_3 = dot(u_xlat1.xyz, u_xlat5.xyz);
					    u_xlat16_3 = u_xlat16_3 + 1.0;
					    u_xlat16_3 = u_xlat16_3 * 0.5;
					    u_xlat16_5 = log2(u_xlat16_3);
					    u_xlat16_5 = u_xlat16_5 * 50.0;
					    u_xlat16_5 = exp2(u_xlat16_5);
					    u_xlat16_10 = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_10 = u_xlat16_10 + u_xlat16_10;
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_5 + u_xlat16_10;
					    u_xlat16_3 = u_xlat16_5 + 2.0;
					    u_xlat5.xy = _MainTex_TexelSize.xy * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat16_2.xyz = texture(_CameraGBufferTexture2, u_xlat5.xy).xyz;
					    u_xlat16_5 = texture(_MainTex, u_xlat5.xy).x;
					    u_xlat10 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb10 = !!(u_xlat10!=0.0);
					#else
					    u_xlatb10 = u_xlat10!=0.0;
					#endif
					    u_xlat10 = (u_xlatb10) ? -1.0 : -0.0;
					    u_xlat2.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat10);
					    u_xlat4.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat2.xxx + u_xlat4.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat16_8 = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat16_8 = u_xlat16_8 + 1.0;
					    u_xlat16_8 = u_xlat16_8 * 0.5;
					    u_xlat16_10 = log2(u_xlat16_8);
					    u_xlat16_10 = u_xlat16_10 * 50.0;
					    u_xlat16_10 = exp2(u_xlat16_10);
					    u_xlat16_0 = u_xlat16_5 * u_xlat16_10 + u_xlat16_0;
					    u_xlat16_3 = u_xlat16_10 + u_xlat16_3;
					    SV_Target0 = vec4(u_xlat16_0) / vec4(u_xlat16_3);
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _BlurVector;
					UNITY_LOCATION(0) uniform mediump sampler2D _CameraGBufferTexture2;
					UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump float u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					mediump float u_xlat16_3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					mediump float u_xlat16_5;
					bool u_xlatb5;
					mediump float u_xlat16_8;
					float u_xlat10;
					mediump float u_xlat16_10;
					bool u_xlatb10;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
					    u_xlat0.xy = (-_MainTex_TexelSize.xy) * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat16_1.xyz = texture(_CameraGBufferTexture2, u_xlat0.xy).xyz;
					    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
					    u_xlat5.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb5 = !!(u_xlat5.x!=0.0);
					#else
					    u_xlatb5 = u_xlat5.x!=0.0;
					#endif
					    u_xlat5.x = (u_xlatb5) ? -1.0 : -0.0;
					    u_xlat5.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat5.xxx;
					    u_xlat1.xyz = u_xlat5.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat5.xxx + u_xlat1.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat5.zzz + u_xlat1.xyz;
					    u_xlat16_1.xyz = texture(_CameraGBufferTexture2, vs_TEXCOORD0.xy).xyz;
					    u_xlat16 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(u_xlat16!=0.0);
					#else
					    u_xlatb16 = u_xlat16!=0.0;
					#endif
					    u_xlat16 = (u_xlatb16) ? -1.0 : -0.0;
					    u_xlat1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat16);
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16_3 = dot(u_xlat1.xyz, u_xlat5.xyz);
					    u_xlat16_3 = u_xlat16_3 + 1.0;
					    u_xlat16_3 = u_xlat16_3 * 0.5;
					    u_xlat16_5 = log2(u_xlat16_3);
					    u_xlat16_5 = u_xlat16_5 * 50.0;
					    u_xlat16_5 = exp2(u_xlat16_5);
					    u_xlat16_10 = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat16_10 = u_xlat16_10 + u_xlat16_10;
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_5 + u_xlat16_10;
					    u_xlat16_3 = u_xlat16_5 + 2.0;
					    u_xlat5.xy = _MainTex_TexelSize.xy * vec2(_BlurVector.x, _BlurVector.y) + vs_TEXCOORD0.xy;
					    u_xlat16_2.xyz = texture(_CameraGBufferTexture2, u_xlat5.xy).xyz;
					    u_xlat16_5 = texture(_MainTex, u_xlat5.xy).x;
					    u_xlat10 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb10 = !!(u_xlat10!=0.0);
					#else
					    u_xlatb10 = u_xlat10!=0.0;
					#endif
					    u_xlat10 = (u_xlatb10) ? -1.0 : -0.0;
					    u_xlat2.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat10);
					    u_xlat4.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat2.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat2.xxx + u_xlat4.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
					    u_xlat16_8 = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat16_8 = u_xlat16_8 + 1.0;
					    u_xlat16_8 = u_xlat16_8 * 0.5;
					    u_xlat16_10 = log2(u_xlat16_8);
					    u_xlat16_10 = u_xlat16_10 * 50.0;
					    u_xlat16_10 = exp2(u_xlat16_10);
					    u_xlat16_0 = u_xlat16_5 * u_xlat16_10 + u_xlat16_0;
					    u_xlat16_3 = u_xlat16_10 + u_xlat16_3;
					    SV_Target0 = vec4(u_xlat16_0) / vec4(u_xlat16_3);
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 507151
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
					int u_xlati3;
					vec2 u_xlat6;
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
					    u_xlati0 = int((0.0<_MainTex_TexelSize.y) ? -1 : 0);
					    u_xlati3 = int((_MainTex_TexelSize.y<0.0) ? -1 : 0);
					    u_xlati0 = (-u_xlati0) + u_xlati3;
					    u_xlat6.y = float(u_xlati0);
					    u_xlat16_2.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat6.x = 1.0;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * u_xlat6.xy + vec2(0.5, 0.5);
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
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _OcclusionTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat10_0.x = texture2D(_OcclusionTexture, vs_TEXCOORD1.xy).x;
					    u_xlat16_1 = (-u_xlat10_0.x) + 1.0;
					    u_xlat16_1 = log2(u_xlat16_1);
					    u_xlat16_1 = u_xlat16_1 * 0.454545468;
					    u_xlat16_1 = exp2(u_xlat16_1);
					    u_xlat16_1 = (-u_xlat16_1) + 1.0;
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.xyz = vec3(u_xlat16_1) * (-u_xlat10_0.xyz) + u_xlat10_0.xyz;
					    SV_Target0.w = u_xlat10_0.w;
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
					uniform 	vec4 _MainTex_TexelSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
					int u_xlati3;
					vec2 u_xlat6;
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
					    u_xlati0 = int((0.0<_MainTex_TexelSize.y) ? -1 : 0);
					    u_xlati3 = int((_MainTex_TexelSize.y<0.0) ? -1 : 0);
					    u_xlati0 = (-u_xlati0) + u_xlati3;
					    u_xlat6.y = float(u_xlati0);
					    u_xlat16_2.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat6.x = 1.0;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * u_xlat6.xy + vec2(0.5, 0.5);
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
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _OcclusionTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat10_0.x = texture2D(_OcclusionTexture, vs_TEXCOORD1.xy).x;
					    u_xlat16_1 = (-u_xlat10_0.x) + 1.0;
					    u_xlat16_1 = log2(u_xlat16_1);
					    u_xlat16_1 = u_xlat16_1 * 0.454545468;
					    u_xlat16_1 = exp2(u_xlat16_1);
					    u_xlat16_1 = (-u_xlat16_1) + 1.0;
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.xyz = vec3(u_xlat16_1) * (-u_xlat10_0.xyz) + u_xlat10_0.xyz;
					    SV_Target0.w = u_xlat10_0.w;
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
					uniform 	vec4 _MainTex_TexelSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
					int u_xlati3;
					vec2 u_xlat6;
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
					    u_xlati0 = int((0.0<_MainTex_TexelSize.y) ? -1 : 0);
					    u_xlati3 = int((_MainTex_TexelSize.y<0.0) ? -1 : 0);
					    u_xlati0 = (-u_xlati0) + u_xlati3;
					    u_xlat6.y = float(u_xlati0);
					    u_xlat16_2.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat6.x = 1.0;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * u_xlat6.xy + vec2(0.5, 0.5);
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
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _OcclusionTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat10_0.x = texture2D(_OcclusionTexture, vs_TEXCOORD1.xy).x;
					    u_xlat16_1 = (-u_xlat10_0.x) + 1.0;
					    u_xlat16_1 = log2(u_xlat16_1);
					    u_xlat16_1 = u_xlat16_1 * 0.454545468;
					    u_xlat16_1 = exp2(u_xlat16_1);
					    u_xlat16_1 = (-u_xlat16_1) + 1.0;
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.xyz = vec3(u_xlat16_1) * (-u_xlat10_0.xyz) + u_xlat10_0.xyz;
					    SV_Target0.w = u_xlat10_0.w;
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
					uniform 	vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
					int u_xlati3;
					vec2 u_xlat6;
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
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = 0.0<_MainTex_TexelSize.y; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati0 = int((0.0<_MainTex_TexelSize.y) ? 0xFFFFFFFFu : uint(0));
					#endif
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = _MainTex_TexelSize.y<0.0; u_xlati3 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati3 = int((_MainTex_TexelSize.y<0.0) ? 0xFFFFFFFFu : uint(0));
					#endif
					    u_xlati0 = (-u_xlati0) + u_xlati3;
					    u_xlat6.y = float(u_xlati0);
					    u_xlat16_2.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat6.x = 1.0;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * u_xlat6.xy + vec2(0.5, 0.5);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _OcclusionTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0.x = texture(_OcclusionTexture, vs_TEXCOORD1.xy).x;
					    u_xlat16_1 = (-u_xlat16_0.x) + 1.0;
					    u_xlat16_1 = log2(u_xlat16_1);
					    u_xlat16_1 = u_xlat16_1 * 0.454545468;
					    u_xlat16_1 = exp2(u_xlat16_1);
					    u_xlat16_1 = (-u_xlat16_1) + 1.0;
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.xyz = vec3(u_xlat16_1) * (-u_xlat16_0.xyz) + u_xlat16_0.xyz;
					    SV_Target0.w = u_xlat16_0.w;
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
					uniform 	vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
					int u_xlati3;
					vec2 u_xlat6;
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
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = 0.0<_MainTex_TexelSize.y; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati0 = int((0.0<_MainTex_TexelSize.y) ? 0xFFFFFFFFu : uint(0));
					#endif
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = _MainTex_TexelSize.y<0.0; u_xlati3 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati3 = int((_MainTex_TexelSize.y<0.0) ? 0xFFFFFFFFu : uint(0));
					#endif
					    u_xlati0 = (-u_xlati0) + u_xlati3;
					    u_xlat6.y = float(u_xlati0);
					    u_xlat16_2.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat6.x = 1.0;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * u_xlat6.xy + vec2(0.5, 0.5);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _OcclusionTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0.x = texture(_OcclusionTexture, vs_TEXCOORD1.xy).x;
					    u_xlat16_1 = (-u_xlat16_0.x) + 1.0;
					    u_xlat16_1 = log2(u_xlat16_1);
					    u_xlat16_1 = u_xlat16_1 * 0.454545468;
					    u_xlat16_1 = exp2(u_xlat16_1);
					    u_xlat16_1 = (-u_xlat16_1) + 1.0;
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.xyz = vec3(u_xlat16_1) * (-u_xlat16_0.xyz) + u_xlat16_0.xyz;
					    SV_Target0.w = u_xlat16_0.w;
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
					uniform 	vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
					int u_xlati3;
					vec2 u_xlat6;
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
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = 0.0<_MainTex_TexelSize.y; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati0 = int((0.0<_MainTex_TexelSize.y) ? 0xFFFFFFFFu : uint(0));
					#endif
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = _MainTex_TexelSize.y<0.0; u_xlati3 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati3 = int((_MainTex_TexelSize.y<0.0) ? 0xFFFFFFFFu : uint(0));
					#endif
					    u_xlati0 = (-u_xlati0) + u_xlati3;
					    u_xlat6.y = float(u_xlati0);
					    u_xlat16_2.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat6.x = 1.0;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * u_xlat6.xy + vec2(0.5, 0.5);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _OcclusionTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0.x = texture(_OcclusionTexture, vs_TEXCOORD1.xy).x;
					    u_xlat16_1 = (-u_xlat16_0.x) + 1.0;
					    u_xlat16_1 = log2(u_xlat16_1);
					    u_xlat16_1 = u_xlat16_1 * 0.454545468;
					    u_xlat16_1 = exp2(u_xlat16_1);
					    u_xlat16_1 = (-u_xlat16_1) + 1.0;
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.xyz = vec3(u_xlat16_1) * (-u_xlat16_0.xyz) + u_xlat16_0.xyz;
					    SV_Target0.w = u_xlat16_0.w;
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
		Pass {
			Blend Zero OneMinusSrcColor, Zero OneMinusSrcAlpha
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 554623
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					void main()
					{
					    gl_Position = in_POSITION0 * vec4(2.0, 2.0, 0.0, 0.0) + vec4(0.0, 0.0, 0.0, 1.0);
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
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					void main()
					{
					    gl_Position = in_POSITION0 * vec4(2.0, 2.0, 0.0, 0.0) + vec4(0.0, 0.0, 0.0, 1.0);
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
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD0;
					void main()
					{
					    gl_Position = in_POSITION0 * vec4(2.0, 2.0, 0.0, 0.0) + vec4(0.0, 0.0, 0.0, 1.0);
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
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					void main()
					{
					    gl_Position = in_POSITION0 * vec4(2.0, 2.0, 0.0, 0.0) + vec4(0.0, 0.0, 0.0, 1.0);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _OcclusionTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    u_xlat16_0 = texture(_OcclusionTexture, vs_TEXCOORD0.xy).x;
					    SV_Target0.w = u_xlat16_0;
					    u_xlat16_1 = (-u_xlat16_0) + 1.0;
					    u_xlat16_1 = log2(u_xlat16_1);
					    u_xlat16_1 = u_xlat16_1 * 0.454545468;
					    u_xlat16_1 = exp2(u_xlat16_1);
					    SV_Target1.xyz = (-vec3(u_xlat16_1)) + vec3(1.0, 1.0, 1.0);
					    SV_Target1.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					void main()
					{
					    gl_Position = in_POSITION0 * vec4(2.0, 2.0, 0.0, 0.0) + vec4(0.0, 0.0, 0.0, 1.0);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _OcclusionTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    u_xlat16_0 = texture(_OcclusionTexture, vs_TEXCOORD0.xy).x;
					    SV_Target0.w = u_xlat16_0;
					    u_xlat16_1 = (-u_xlat16_0) + 1.0;
					    u_xlat16_1 = log2(u_xlat16_1);
					    u_xlat16_1 = u_xlat16_1 * 0.454545468;
					    u_xlat16_1 = exp2(u_xlat16_1);
					    SV_Target1.xyz = (-vec3(u_xlat16_1)) + vec3(1.0, 1.0, 1.0);
					    SV_Target1.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					void main()
					{
					    gl_Position = in_POSITION0 * vec4(2.0, 2.0, 0.0, 0.0) + vec4(0.0, 0.0, 0.0, 1.0);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _OcclusionTexture;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    u_xlat16_0 = texture(_OcclusionTexture, vs_TEXCOORD0.xy).x;
					    SV_Target0.w = u_xlat16_0;
					    u_xlat16_1 = (-u_xlat16_0) + 1.0;
					    u_xlat16_1 = log2(u_xlat16_1);
					    u_xlat16_1 = u_xlat16_1 * 0.454545468;
					    u_xlat16_1 = exp2(u_xlat16_1);
					    SV_Target1.xyz = (-vec3(u_xlat16_1)) + vec3(1.0, 1.0, 1.0);
					    SV_Target1.w = 0.0;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 593599
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_TexelSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
					int u_xlati3;
					vec2 u_xlat6;
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
					    u_xlati0 = int((0.0<_MainTex_TexelSize.y) ? -1 : 0);
					    u_xlati3 = int((_MainTex_TexelSize.y<0.0) ? -1 : 0);
					    u_xlati0 = (-u_xlati0) + u_xlati3;
					    u_xlat6.y = float(u_xlati0);
					    u_xlat16_2.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat6.x = 1.0;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * u_xlat6.xy + vec2(0.5, 0.5);
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
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _OcclusionTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp float u_xlat10_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_OcclusionTexture, vs_TEXCOORD1.xy).x;
					    u_xlat16_1 = (-u_xlat10_0) + 1.0;
					    u_xlat16_1 = log2(u_xlat16_1);
					    u_xlat16_1 = u_xlat16_1 * 0.454545468;
					    u_xlat16_1 = exp2(u_xlat16_1);
					    u_xlat16_1 = (-u_xlat16_1) + 1.0;
					    SV_Target0.xyz = (-vec3(u_xlat16_1)) + vec3(1.0, 1.0, 1.0);
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0.w = u_xlat10_0;
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
					uniform 	vec4 _MainTex_TexelSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
					int u_xlati3;
					vec2 u_xlat6;
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
					    u_xlati0 = int((0.0<_MainTex_TexelSize.y) ? -1 : 0);
					    u_xlati3 = int((_MainTex_TexelSize.y<0.0) ? -1 : 0);
					    u_xlati0 = (-u_xlati0) + u_xlati3;
					    u_xlat6.y = float(u_xlati0);
					    u_xlat16_2.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat6.x = 1.0;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * u_xlat6.xy + vec2(0.5, 0.5);
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
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _OcclusionTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp float u_xlat10_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_OcclusionTexture, vs_TEXCOORD1.xy).x;
					    u_xlat16_1 = (-u_xlat10_0) + 1.0;
					    u_xlat16_1 = log2(u_xlat16_1);
					    u_xlat16_1 = u_xlat16_1 * 0.454545468;
					    u_xlat16_1 = exp2(u_xlat16_1);
					    u_xlat16_1 = (-u_xlat16_1) + 1.0;
					    SV_Target0.xyz = (-vec3(u_xlat16_1)) + vec3(1.0, 1.0, 1.0);
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0.w = u_xlat10_0;
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
					uniform 	vec4 _MainTex_TexelSize;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
					int u_xlati3;
					vec2 u_xlat6;
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
					    u_xlati0 = int((0.0<_MainTex_TexelSize.y) ? -1 : 0);
					    u_xlati3 = int((_MainTex_TexelSize.y<0.0) ? -1 : 0);
					    u_xlati0 = (-u_xlati0) + u_xlati3;
					    u_xlat6.y = float(u_xlati0);
					    u_xlat16_2.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat6.x = 1.0;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * u_xlat6.xy + vec2(0.5, 0.5);
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
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _OcclusionTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp float u_xlat10_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_OcclusionTexture, vs_TEXCOORD1.xy).x;
					    u_xlat16_1 = (-u_xlat10_0) + 1.0;
					    u_xlat16_1 = log2(u_xlat16_1);
					    u_xlat16_1 = u_xlat16_1 * 0.454545468;
					    u_xlat16_1 = exp2(u_xlat16_1);
					    u_xlat16_1 = (-u_xlat16_1) + 1.0;
					    SV_Target0.xyz = (-vec3(u_xlat16_1)) + vec3(1.0, 1.0, 1.0);
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0.w = u_xlat10_0;
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
					uniform 	vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
					int u_xlati3;
					vec2 u_xlat6;
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
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = 0.0<_MainTex_TexelSize.y; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati0 = int((0.0<_MainTex_TexelSize.y) ? 0xFFFFFFFFu : uint(0));
					#endif
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = _MainTex_TexelSize.y<0.0; u_xlati3 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati3 = int((_MainTex_TexelSize.y<0.0) ? 0xFFFFFFFFu : uint(0));
					#endif
					    u_xlati0 = (-u_xlati0) + u_xlati3;
					    u_xlat6.y = float(u_xlati0);
					    u_xlat16_2.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat6.x = 1.0;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * u_xlat6.xy + vec2(0.5, 0.5);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _OcclusionTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_OcclusionTexture, vs_TEXCOORD1.xy).x;
					    u_xlat16_1 = (-u_xlat16_0) + 1.0;
					    u_xlat16_1 = log2(u_xlat16_1);
					    u_xlat16_1 = u_xlat16_1 * 0.454545468;
					    u_xlat16_1 = exp2(u_xlat16_1);
					    u_xlat16_1 = (-u_xlat16_1) + 1.0;
					    SV_Target0.xyz = (-vec3(u_xlat16_1)) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0.w = u_xlat16_0;
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
					uniform 	vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
					int u_xlati3;
					vec2 u_xlat6;
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
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = 0.0<_MainTex_TexelSize.y; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati0 = int((0.0<_MainTex_TexelSize.y) ? 0xFFFFFFFFu : uint(0));
					#endif
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = _MainTex_TexelSize.y<0.0; u_xlati3 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati3 = int((_MainTex_TexelSize.y<0.0) ? 0xFFFFFFFFu : uint(0));
					#endif
					    u_xlati0 = (-u_xlati0) + u_xlati3;
					    u_xlat6.y = float(u_xlati0);
					    u_xlat16_2.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat6.x = 1.0;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * u_xlat6.xy + vec2(0.5, 0.5);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _OcclusionTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_OcclusionTexture, vs_TEXCOORD1.xy).x;
					    u_xlat16_1 = (-u_xlat16_0) + 1.0;
					    u_xlat16_1 = log2(u_xlat16_1);
					    u_xlat16_1 = u_xlat16_1 * 0.454545468;
					    u_xlat16_1 = exp2(u_xlat16_1);
					    u_xlat16_1 = (-u_xlat16_1) + 1.0;
					    SV_Target0.xyz = (-vec3(u_xlat16_1)) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0.w = u_xlat16_0;
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
					uniform 	vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
					int u_xlati3;
					vec2 u_xlat6;
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
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = 0.0<_MainTex_TexelSize.y; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati0 = int((0.0<_MainTex_TexelSize.y) ? 0xFFFFFFFFu : uint(0));
					#endif
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = _MainTex_TexelSize.y<0.0; u_xlati3 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
					#else
					    u_xlati3 = int((_MainTex_TexelSize.y<0.0) ? 0xFFFFFFFFu : uint(0));
					#endif
					    u_xlati0 = (-u_xlati0) + u_xlati3;
					    u_xlat6.y = float(u_xlati0);
					    u_xlat16_2.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat6.x = 1.0;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * u_xlat6.xy + vec2(0.5, 0.5);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _OcclusionTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_OcclusionTexture, vs_TEXCOORD1.xy).x;
					    u_xlat16_1 = (-u_xlat16_0) + 1.0;
					    u_xlat16_1 = log2(u_xlat16_1);
					    u_xlat16_1 = u_xlat16_1 * 0.454545468;
					    u_xlat16_1 = exp2(u_xlat16_1);
					    u_xlat16_1 = (-u_xlat16_1) + 1.0;
					    SV_Target0.xyz = (-vec3(u_xlat16_1)) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    SV_Target0.w = u_xlat16_0;
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